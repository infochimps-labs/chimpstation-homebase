# Chimpstation-homebase: infochimps developers' desktop environment

This repo uses chef and ironfan to provision a developer workstation on OSX. It unifies:

* Cookbooks, roles, and environments
* Cluster descriptions
* Your Chef and cloud credentials
* Pantries (collections of cookbooks, roles and so forth)


# ISSUES

Yeah so there is some permissions issues since you don't want to run this as root. Briefly make the /Applications directory writeable (note -- do not use the `-R` (recursive) flag!)

          sudo chgrp admin /Applications/ 
          sudo chmod g+wrx /Applications/


## Before getting started


* install `Xcode` and the no-longer-installed-with-Xcode [GCC compiler binary](https://github.com/kennethreitz/osx-gcc-installer).

* Follow [instructions to install Homebrew](https://github.com/mxcl/homebrew/wiki/installation), and install a few basic packages:
  
            /usr/bin/ruby -e "$(/usr/bin/curl -fsSL https://raw.github.com/gist/323731)"
            brew install readline coreutils git
            brew update
        
* some version of ruby, preferably in the 1.9 family. I *think* that Lion is ruby 1.9 -- run `ruby --version`. As long as it's `1.9.2-p100` or newer you're good. 
  - otherwise Install rbenv to give you control over your ruby environment. See instructions at rbenv site

            brew install git ruby-build rbenv
            rbenv install 1.9.3-p0
            rbenv rehash
            echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
        
* install chef and ironfan

            gem install chef ironfan

* pick up down below.



## Getting Started

We'll use the following conventions:

* `${organization}`  for the name of your chef organization
* `${chef_user}`     for your user name on the chef server
* `${chimpstation}`  for the directory holding your chimpstation-homebase repo

### First time per organization

You only have to do the following once:

* chimpstation repo
  - on github, fork the [chimpstation-homebase](http://github.com/infochimps-labs/chimpstation) repo
  - clone it to your machine, into the directory you'll use (`${chimpstation}`)
  - run the following to produce a new credentials repo. Note that the credentials directory will *not* be added to the chimpstation-homebase; you should use a separate git remote for it.

            cd knife
            cp -rp example-credentials        ${organization}-credentials
            ln -s ${organization}-credentials credentials
            cd ..
            ln -s ./knife .chef
            git add . ; git commit -m "set up credentials pointers"
        
* chef organization  

  - go to opscode, create a chef organization. 
  - download the `${organization}-validator.pem` to `knife/credentials`
  - copy your chef server user key to `knife/credentials/${chef_user}.pem`
  - fix the permissions on the key files: `chmod 600 knife/credentials/*.pem`
  
* populate the chef server:

            knife cookbook upload --all
            knife role from file roles/*.rb
            knife environment from file environments/ws.rb

### Per-user

* chimpstation repo:
  - clone your chimpstation-homebase repo to your machine, into the directory you'll use (`${chimpstation}`)

            git clone git@github.com:infochimps-labs/chimpstation-homebase.git chimpstation 
            cd chimpstation
            git submodule update --init
            git submodule foreach git checkout master
            ln -s ./knife .chef

  - grab the credentials repo from a co-worker, and put it as `knife/${organization}-credentials`.
  
Commands like `knife client list` should now work; note that you have to cd into the chimpstation to do so.

* initialize workstation
  - in the `clusters/workstation.rb` file, add a facet named for yourself (`${chef_user}`)
  - `knife cluster sync workstation-${chef_user} --sync-all --no-cloud` will create the chef node for you, and leave the client key in `knife/credentials/client_keys/client-workstation-${chef_user}-0.pem`.
  - run the following (note the `$USER` vs `$chef_user`)
     
            sudo mkdir /etc/chef
            sudo chown $USER /etc/chef
            cp knife/credentials/client_keys/client-workstation-${chef_user}-0.pem /etc/chef
            cp config/client.rb /etc/chef
            mkdir -p /usr/local/var/chef/$USER

  - lastly, edit the top section of the `/etc/chef/client.rb` file to add your organization, facet and facet_index

* run `chef-client` -- your workstation should configure itself!!

# What it do



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
