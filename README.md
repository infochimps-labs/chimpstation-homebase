# Chimpstation-homebase: infochimps developers' desktop environment

This repo uses chef and ironfan to provision a developer workstation on OSX.

## Index

Chimpstation uses ironfan, an expressive toolset for constructing scalable, resilient architectures.

* [ironfan-homebase](https://github.com/infochimps-labs/ironfan-homebase): centralizes the cookbooks, roles and clusters. A solid foundation for any chef user.
* [ironfan gem](https://github.com/infochimps-labs/ironfan): core ironfan models, and knife plugins to orchestrate machines and coordinate truth among you homebase, cloud and chef server.
* [ironfan-pantry](https://github.com/infochimps-labs/ironfan-pantry): Our collection of industrial-strength, cloud-ready recipes for Hadoop, HBase, Cassandra, Elasticsearch, Zabbix and more.
* [silverware cookbook](https://github.com/infochimps-labs/ironfan-homebase/tree/master/cookbooks/silverware): coordinate discovery of services ("list all the machines for `awesome_webapp`, that I might load balance them") and aspects ("list all components that write logs, that I might logrotate them, or that I might monitor the free space on their volumes".
* [ironfan-ci](https://github.com/infochimps-labs/ironfan-ci): Continuous integration testing of not just your cookbooks but your *architecture*.

* [ironfan wiki](https://github.com/infochimps-labs/ironfan/wiki): high-level documentation and install instructions
* [ironfan issues](https://github.com/infochimps-labs/ironfan/issues): bugs, questions and feature requests for *any* part of the ironfan toolset.
* [ironfan gem docs](http://rdoc.info/gems/ironfan): rdoc docs for ironfan

Please file all issues on [ironfan issues](https://github.com/infochimps-labs/ironfan/issues).

## Credits

Ideas, code, inspiration, two bucks in change, an old copy of Tiger Beat, but mostly code were taken from:

* [pivotal_workstation]
* [OSX Cookbooks](https://github.com/josh/osx-cookbooks/tree/master/scratch) by Joshua Peek
* [Installing Virtualbox on OSX with Chef](http://jtimberman.posterous.com/installing-virtualbox-on-osx-with-chef), [Managing my Workstations with Chef](http://jtimberman.posterous.com/managing-my-workstations-with-chef) and [Managing my Workstations with Chef II: Electric Boogaloo](http://jtimberman.posterous.com/update-to-managing-my-workstations) by J Timberman

