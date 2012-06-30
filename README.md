# Chimpstation-homebase: infochimps developers' desktop environment

This repo uses chef and ironfan to provision a developer workstation on OSX. It unifies:

* Cookbooks, roles, and environments
* Cluster descriptions
* Your Chef and cloud credentials
* Pantries (collections of cookbooks, roles and so forth)

## Getting Started

### Environment variables

Customize the following and add it to your startup script (`.zsh_profile` for zsh users, `.bash_profile` for bash users):

```bash
    export CSTN_DIR=$HOME/dev/chimpstation    # the directory holding chimpstation-homebase
    export CSTN_ORG="chimpstation"            # the name of your chef organization
    export CSTN_CLUSTER="ducats"              # the name of the chef cluster for your boxes
    export CSTN_FACET="coolhand"              # the name of the chef facet for your machine
    export CHEF_USER="dlaw"                   # your user name on the chef server
```

Source the file, so those variables are set:

    source ~/.bash_profile    # (or ~/.zsh_profile)

### Install preliminaries

Install `Xcode` and the no-longer-installed-with-Xcode [GCC compiler binary](https://github.com/kennethreitz/osx-gcc-installer).

Install homebrew (and take ownership of `/usr/local`) if it's not already installed:

```bash
    sudo chown -R $USER /usr/local
    /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/mxcl/homebrew/master/Library/Contributions/install_homebrew.rb)"
```

Run `brew doctor` and follow its instructions to make homebrew happy:

    brew doctor

Ensure brew is up-to-date:

    brew update

If you don't have ruby installed, or your ruby is out of date (< 1.9.2-p125):

```bash
    brew install git readline ruby-build rbenv
    rbenv install 1.9.3-p194
    rbenv rehash
    echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
    source ~/.bash_profile
```

Install a few gems (chef, ironfan, and pry) and programs:

```bash
    brew install gecode  # if this fails, see TROUBLESHOOTING below.
    cd ${CSTN_DIR}
    bundle update
```


### Create homebase

Make your own chimpstation repo by forking the [chimpstation-homebase](http://github.com/infochimps-labs/chimpstation) repo. Clone it to your machine:

    git clone git://github.com/infochimps-labs/chimpstation-homebase.git ${CSTN_DIR}

Initialize all the git submodules and set up a symlink:

    ```bash
    cd ${CSTN_DIR}
    git submodule update --init
    git submodule foreach git checkout master
    git submodule foreach git pull
    ln -sn ./knife .chef
    ```

At this point running `knife` should display all possible knife commands. `knife cluster list`, however, will fail, because knife isn't yet authorized to talk to the chef server.

Make a home for your credentials. Note that the credentials directory will *not* be added to the chimpstation-homebase.

    ```bash
    cd ${CSTN_DIR}
    cp -rp knife/example-credentials knife/${CSTN_ORG}-credentials
    ln -s ${CSTN_ORG}-credentials knife/credentials
    mv knife/credentials/knife-user-example.rb knife/credentials/knife-user-${CHEF_USER}.rb
    ln -s ./knife .chef
    git add . ; git commit -m "set up credentials pointers"
    ```

### Chef organization

Create a chef organization:
* go to opscode, create a chef organization with the name you set `$CSTN_ORG` to.
* download the `${CSTN_ORG}-validator.pem` to `${CSTN_DIR}/knife/credentials`
* copy your chef server user key to `${CSTN_DIR}/knife/credentials/${CHEF_USER}.pem`
* fix the permissions on the key files: `chmod 600 knife/credentials/*.pem`

`knife client list` should now work, and you should see your username among the entries. You shouldn't see it error out.

Seed the chef server:

    ```bash
    cd ${CSTN_DIR}
    knife cookbook upload --all
    knife role from file roles/*.rb
    knife environment from file environment/ws.rb
    ```

Check that they all uploaded:

    ```bash
    knife cookbook list
    knife role list
    knife environment list
    ```

### Configuring Your Personal Cluster

Create a new cluster configuration file from the example template:

```bash
    cd ${CSTN_DIR}
    cp clusters/example.rb clusters/${CSTN_CLUSTER}.rb
```

MAKE SURE TO ADJUST the following override in the cluster file:

```ruby
      cluster_role.override_attributes({
        :chef_server => {
            # set this to YOUR username on the local machine
           :user => '$USER',
        }
      })
```

Yes, that should be *your user* on your local machine (not the `$CHEF_USER`, and not 'chef').


### Running Chef Client

Now sync your cluster definitions and run `chef-client`! Your workstation should provision itself.

```bash
    knife cluster sync ${CSTN_CLUSTER}-${CSTN_FACET} --sync-all --no-cloud
    chef-client -c $CSTN_DIR/config/client.rb
```

While running chef-client you might hit a few errors. Debug them as necessary.

If you see `sh: 1: Permission denied` when chef-client starts running, ignore it -- it's a harmless bug in ohai.

## Starting Chef Server

Before you start chef-server the first time, check that all the chef services are not running (`ps aux | egrep 'chef|rabbit|couch|epmd|solr'`) and run the setup script:

    sh /usr/local/etc/chef/setup-chef-server.sh

It should run without complaint, and you should see a just-made file `/usr/local/etc/chef/webui.pem`.

The chimpstation cookbooks are configured to leave no services running by default -- we assume you will want full control over their start/stop state. To start the daemons, run:

```bash
    foreman start -f /usr/local/etc/chef/Procfile-chef-backend & sleep 5
    foreman start -f /usr/local/etc/chef/Procfile-chef-server &
```

## Local homebase

The chimpstation homebase is for configuring *your* machine. Now you need the proper ironfan homebase.

(note: you should probably reference the actual ironfan install, it's more detailed; defer to it unless something here makes more sense in a local context.)

Check out a copy of the ironfan-homebase, initialize all the git submodules and set up a symlink:

```bash
    cd $HOME
    git clone --recursive git://github.com/infochimps-labs/ironfan-homebase.git ${CHEF_HOMEBASE}
    cd ${CHEF_HOMEBASE}
    git submodule foreach git checkout master
    git submodule foreach git pull
    ln -sn ./knife .chef
```

Set up the credentials dir:

```bash
    cd ${CHEF_HOMEBASE}
    cp -rp knife/example-credentials knife/local-credentials
    ln -sn local-credentials knife/credentials
    mv knife/credentials/knife-user-example.rb knife/credentials/knife-user-${CHEF_USER}.rb
    cp /usr/local/etc/chef/validation.pem knife/credentials/local-validator.pem
```

Edit your `$CHEF_HOMEBASE/knife/credentials/knife-org.rb` file:

```ruby
    Chef::Config.instance_eval do
      organization            "local"
      validation_client_name  'chef-validator'
      validation_key          "#{credentials_path}/#{organization}-validator.pem"
      hostname =              `hostname -f`.chomp
      chef_server_url         "http://#{hostname}:4000/"     # for local
      host_network_base       '33.33.33'
      host_network_ip_mapping :chef_server => 20, :sandbox => 30, :elasticsearch => 40
    end
```

Log in to the [chef webui](http://localhost:4040)
  - username `admin`, password `p@ssw0rd1`
  - change it immediately
  - [make a user account](http://localhost:4040/users/new) for yourself. Best to name it the same as your opscode chef account ID
  - [create a clients](http://localhost:4040/clients/new) with the *same name*.
  - copy the private key -- everything from `-----BEGIN RSA PRIVATE KEY` to `-----END RSA PRIVATE KEY-----`, including those lines -- into

Run `knife client list`; you should see your client, along with `chef-validator` and `chef-webui`.

Hooray! now populate the chef server:

```bash
    knife cookbook upload --all
    knife role from file roles/*.rb
    for chefenv in prod stag dev ; do knife environment from file environments/${chefenv}.rb ; done

    # Check that they all uploaded
    knife cookbook list
    knife role list
    knife environment list
```

Follow the instructions in [ironfan-ci](http://github.com/infochimps-labs/ironfan-ci) for setting up vagrant and importing your basebox. Vagrant up:

```bash
      knife cluster vagrant up sandbox-simple-0 -VV
```

## Troubleshooting

### brew install of `gecode` fails

If installing `gecode` fails, try editing `/usr/local/Library/Formula/gecode.rb` to say:

    def install
      system "./configure", .... "--with-architectures=i386,x86_64","--disable-qt"
      ...
    end

And then re-run `brew install gecode`


### resetting your system

#### remove chef, rabbitmq and couchdb

*Note: This will remove these entirely*.

If the following command shows anything is running, stop it:

    ps axu | egrep -i 'rabbit|chef|couch|beam|epmd' | egrep -v 'grep'
    ps axu | egrep -i 'virtualbox' | egrep -v 'grep'

now uninstall:

    mkdir -p /tmp/chef-away/{etc,etc/logrotate.d,var/{log,run,chef,lib}} /tmp/chef-away/Applications
    brew unlink         rabbitmq couchdb
    brew remove --force rabbitmq couchdb
    (cd /usr/local ; for dir in {etc,etc/logrotate.d,var/*,var}/{couchdb,rabbitmq,chef}* ; do mv $dir /tmp/chef-away/$dir ; done )
    mv /Applications/VirtualBox.app /tmp/chef-away/Applications

nothing should be running, and only items in Library should match:

    ps axu | egrep -i 'rabbit|chef|couch|beam|epmd|virtualbox' | egrep -v 'grep'
    find /usr/local/{lib,var,etc} -iname '*rabbit*' -o -iname '*couch*' -o -iname '*chef*'

#### reset your chimpstation chef node

    knife client delete ${CSTN_CLUSTER}-${CSTN_FACET}-0
    knife node   delete ${CSTN_CLUSTER}-${CSTN_FACET}-0
    rm ${CSTN_DIR}/knife/credentials/client_keys/client-${CSTN_CLUSTER}-${CSTN_FACET}-0

__________________________________________________________________________
__________________________________________________________________________
__________________________________________________________________________


# Ironfan Toolset

Chimpstation uses ironfan, an expressive toolset for constructing scalable, resilient architectures. The full Ironfan toolset:

### Tools:

* [ironfan-homebase](https://github.com/infochimps-labs/ironfan-homebase): Centralizes the cookbooks, roles and clusters. A solid foundation for any Chef user.
* [ironfan gem](https://github.com/infochimps-labs/ironfan): The core Ironfan models, and Knife plugins to orchestrate machines and coordinate truth among your homebase, cloud and chef server.
* [ironfan-pantry](https://github.com/infochimps-labs/ironfan-pantry): Our collection of industrial-strength, cloud-ready recipes for Hadoop, HBase, Cassandra, Elasticsearch, Zabbix and more.
* [silverware cookbook](https://github.com/infochimps-labs/ironfan-pantry/tree/master/cookbooks/silverware): Helps you coordinate discovery of services ("list all the machines for `awesome_webapp`, that I might load balance them") and aspects ("list all components that write logs, that I might logrotate them, or that I might monitor the free space on their volumes"). Found within the [ironfan-pantry](https://github.com/infochimps-labs/ironfan-pantry).

### Documentation:

* [index of wiki pages](https://github.com/infochimps-labs/ironfan/wiki/_pages)
* [ironfan wiki](https://github.com/infochimps-labs/ironfan/wiki): High-level documentation and install instructions.
* [ironfan issues](https://github.com/infochimps-labs/ironfan/issues): Bugs or questions and feature requests for *any* part of the Ironfan toolset.
* [ironfan gem docs](http://rdoc.info/gems/ironfan): Rdoc docs for Ironfan.
* [Ironfan Screen Cast](http://vimeo.com/37279372)-- build a Hadoop cluster from scratch in 20 minutes.

To jump right into using Ironfan, follow our [Installation Instructions](https://github.com/infochimps-labs/ironfan/wiki/INSTALL). For an explanatory tour, check out our [Web Walkthrough](https://github.com/infochimps-labs/ironfan/wiki/walkthrough-web).  Please file all issues on [Ironfan Issues](https://github.com/infochimps-labs/ironfan/issues).

## Credits

Ideas, code, inspiration, two bucks in change, an old copy of Tiger Beat, but mostly code were taken from:

* [pivotal_workstation]
* [OSX Cookbooks](https://github.com/josh/osx-cookbooks/tree/master/scratch) by Joshua Peek
* [Installing Virtualbox on OSX with Chef](http://jtimberman.posterous.com/installing-virtualbox-on-osx-with-chef), [Managing my Workstations with Chef](http://jtimberman.posterous.com/managing-my-workstations-with-chef) and [Managing my Workstations with Chef II: Electric Boogaloo](http://jtimberman.posterous.com/update-to-managing-my-workstations) by J Timberman
