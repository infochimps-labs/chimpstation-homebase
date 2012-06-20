name        "osx_package_set_definitions"
description "Chimpstation OSX: define package sets for OSX -- does not install anything"

run_list(*%w[
  recipe[package_set]
  ])

default_attributes({
    :package_set => {
      :install     => %w[ !merge: ], # blows away the (debian-centric) default
      :pkgs        => {

        :osx_base        => %w[ readline binutils coreutils findutils patchutils
                                proctools zsh bash bash-completion parallel
                                git git-subtree ctags gnu-sed gnu-tar sqlite ack
                                colordiff csshx curl subversion tmux tree wget dos2unix
                                htop ifstat ncftp netcat ],
        :osx_libs        => %w[ bcrypt gettext libevent libexif libffi libgcrypt
                                libgsasl libident libidn libxml2 libxslt libyaml
                                openssl pcre ragel neon lzlib lzo ],
        :osx_cloud       => %w[ aws-iam-tools ec2-ami-tools ec2-api-tools elb-tools s3cmd s3sync ],

        # Selectively installed:

        :osx_web_dev     => %w[ node coffee-script imagemagick pow ],
        :osx_data_miner  => %w[ node nginx ],

      },
      :gems          => {
        :osx_base          => %w[ bundler activesupport yard rspec guard json cheat
                                  pry awesome_print wirble hirb configliere gorillib ],
        #
        # :osx_cloud       => %w[ chef ohai ironfan fog right_aws vagrant veewee ],
        # :osx_chef_server => %w[ chef chef-server-api chef-server-webui chef-solr chef-expander ],
        # :osx_web_dev     => %w[ sinatra gollum jekyll powder ],
      }
    }
  })
