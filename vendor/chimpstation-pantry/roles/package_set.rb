name        "package_set"
description "Chimpstation: bulk installs package sets"

run_list(*%w[
  recipe[homebrew]
  recipe[package_set]
  ])

override_attributes({
    # Package sets to install. Add or remove as convenience & prudence dictate.
    :package_set => {
      :install     => %w[
        osx_base osx_dev osx_libs osx_sysadmin osx_editors
        osx_chef_server osx_web_dev osx_testing
        osx_langs osx_text osx_cloud ],
      }

  })

default_attributes({
    :package_set => {
      :install     => %w[ !merge: ], # blows away the (debian-centric) default
      :pkgs        => {
        :osx_base        => [
          "readline", "binutils", "coreutils", "findutils", "patchutils", "proctools",
          "zsh", "bash", "bash-completion", "parallel", ],

        :osx_dev         => [
          "git", "git-subtree", "git-utils", "ctags", "gnu-indent", "gnu-sed",
          "gnu-tar", "gnu-time", "sqlite", "ack", "colordiff", "csshx", "ctags", "curl",
          "elinks", "growlnotify", "lesspipe", "tmux", "tree", "wget", ],

        :osx_libs        => [
          "bcrypt", "gettext", "libevent", "libexif", "libffi", "libgcrypt", "libgit2",
          "libgpg-error", "libgsasl", "libident", "libidn", "librsync", "libssh2",
          "libxml2", "libxslt", "libyaml", "libzip", "oniguruma", "openssl", "pcre",
          "ragel", "snappy", "neon", "base64", "dos2unix", "lzlib", "lzo", "md5deep", ],

        :osx_sysadmin    => [
          "htop", "httperf", "ifstat", "imlib2", "ncftp", "netcat", "nmap", "tcpstat",
          "tcptrace", "pstree", "ssh-copy-id", "watch", "subversion", ],

        :osx_editors     => [ "emacs", "macvim", ],
        :osx_chef_server => [ "rabbitmq", "couchdb", ],
        :osx_web_dev     => [ "nginx", "coffee-script", "node", "imagemagick", ],
        :osx_data_miner  => [ "nginx", "coffee-script", "node", "imagemagick", ],

        :osx_langs       => [ "coffee-script", "lua", "luarocks", "node", "phantomjs", "r", "v8", ],
        :osx_cloud       => [ "aws-iam-tools", "ec2-ami-tools", "ec2-api-tools", "elb-tools", "s3cmd", "s3sync", ],

        # These are not installed by default

        :osx_backend     => [ "elasticsearch", "flume", "hadoop", "hbase", "hive", "pig", "redis", "redis-tools", "mongodb", "nginx", "pow", ],
        :osx_backend_2   => [ "cassandra", "couchdb", "jenkins", "postgresql", "rabbitmq", "syslog-ng", "varnish", "zeromq" ],

      },
      :gems          => {
        :osx_base        => %w[ bundler jeweler ],
        :osx_dev         => %w[
          activesupport extlib json yajl-ruby multi_json addressable cheat
          pry awesome_print wirble hirb jeweler guard
          configliere gorillib log4r log_buddy
        ],
        :osx_sysadmin    => %w[],
        :osx_data_miner  => %w[ wukong jeweler yard rspec ],
        :osx_chef_server => %w[ chef chef-server-api chef-server-webui chef-solr chef-expander ],
        :osx_web_dev     => %w[ sinatra gollum jekyll powder ],
        :osx_testing     => %w[ rspec cucumber
                          guard guard-rspec guard-spork guard-livereload guard-bundler guard-pow guard-rake guard-process guard-chef ],
        :osx_text        => %w[ nokogiri erubis i18n tilt bluecloth haml compass ],
        :osx_cloud       => %w[ chef ohai ironfan fog right_aws vagrant veewee ],
      }
    }
  })
