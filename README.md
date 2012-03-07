# Chimpstation-homebase: infochimps developers' desktop environment

This repo uses chef and ironfan to provision a developer workstation on OSX. It unifies:

* Cookbooks, roles, and environments
* Cluster descriptions
* Your Chef and cloud credentials
* Pantries (collections of cookbooks, roles and so forth)



## Getting Started

We'll use the following conventions:

* `${organization}`  for the name of your chef organization
* `${chef_user}`     for your user name on the chef server
* `${homebase}`      for the directory holding your repo

* homebase repo
  - on github, fork the [chimpstation-homebase](http://github.com/infochimps-labs/chimpstation) repo
  - clone it to your machine, into the directory you'll use (`${homebase}`)
  - run the following to produce a new credentials repo
  
        cp -rp knife/example-credentials knife/${organization}-credentials
        ln -s knife .chef
        cd knife
        ln -s ${organization}-credentials credentials
        
* chef organization  
  - go to opscode, create a chef organization. 
  - download the `${organization}-validator.pem` to `knife/credentials`
  - copy your chef server user key to `knife/credentials/${chef_user}.pem`
  - fix the permissions on the key files: `chmod 600 knife/credentials/*.pem`
  

* initialize workstation
  - `gem install chef ironfan`
  - in the `clusters/workstation.rb` file, add a facet named for yourself (`${chef_user}`)
  - `knife cluster sync workstation-${chef_user} --sync-all --no-cloud` will create the chef node for you, and leave the client key in `knife/credentials/client_keys/client-workstation-${chef_user}-0.pem`.
  - run
     
        sudo mkdir /etc/chef
        sudo chown $USER /etc/chef
        cp knife/credentials/client_keys/client-workstation-${chef_user}-0.pem /etc/chef
        cp config/client.rb /etc/chef
        

# What it does






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
