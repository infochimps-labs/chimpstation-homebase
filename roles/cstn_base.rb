name        "cstn_base"
description "Chimpstation: base config"

run_list(
  "recipe[homebrew]",
  # "recipe[package_set]"
  )


default_attributes({
    # Package sets to install. Add or remove as convenience & prudence dictate.
    :package_set => {
      :install     => %w[ !merge: osx_base osx_dev osx_libs osx_sysadmin osx_editors osx_chef_server osx_web_dev osx_backend osx_testing osx_langs osx_text osx_cloud ],
      :pkgs        => {

        :osx_base        => [
          "readline", "binutils", "coreutils", "findutils", "patchutils", "proctools",
          "zsh", "bash", "bash-completion", ],

        :osx_dev         => [
          "git", "git-subtree", "git-utils", "subversion", "ctags", "gnu-indent", "gnu-sed",
          "gnu-tar", "gnu-time", "sqlite", "ack", "colordiff", "csshx", "ctags", "curl",
          "elinks", "growlnotify", "lesspipe", "pigz", "tmux", "tree", "wget", ],

        :osx_libs        => [
          "bcrypt", "gettext", "libevent", "libexif", "libffi", "libgcrypt", "libgit2",
          "libgpg-error", "libgsasl", "libident", "libidn", "librsync", "libssh2",
          "libxml2", "libxslt", "libyaml", "libzip", "oniguruma", "openssl", "pcre",
          "ragel", "snappy", "neon", "base64", "dos2unix", "lzlib", "lzo", "md5deep", ],

        :osx_sysadmin    => [
          "htop", "httperf", "ifstat", "imlib2", "ncftp", "netcat", "nmap", "tcpstat",
          "tcptrace", "pstree", "ssh-copy-id", "watch", "imagemagick", ],

        :osx_editors     => [ "emacs", "macvim", ],
        :osx_chef_server => [ "rabbitmq", "couchdb", ],
        :osx_web_dev     => [ "nginx", "pow", "coffee-script", "node", ],

        :osx_backend     => [ "elasticsearch", "flume", "hadoop", "hbase", "hive", "pig", "redis", "redis-tools", "mongodb", "nginx", "pow", ],
        :osx_backend_2   => [ "cassandra", "couchdb", "jenkins", "postgresql", "rabbitmq", "syslog-ng", "varnish", "zeromq" ],

        :osx_langs       => [ "coffee-script", "gradle", "lua", "luarocks", "node", "phantomjs", "python3", "r", "v8", ],
        :osx_cloud       => [ "aws-iam-tools", "ec2-ami-tools", "ec2-api-tools", "elb-tools", "s3cmd", "s3sync", ],

      },
      :gems          => {

        :osx_base        => %w[ bundler jeweler thor yard ],
        :osx_dev         => %w[
          rails extlib json crack yajl-ruby addressable rest-client
          awesome_print pry wirble hirb cheat guard watchr highline formatador gist qwandry
          configliere gorillib wukong ],
        :osx_sysadmin    => %w[],
        :osx_chef_server => %w[ chef chef-server-api chef-server-webui chef-solr chef-expander ],
        :osx_web_dev     => %w[ sinatra gollum jekyll powder ],
        :osx_testing     => %w[ rspec cucumber
                          guard guard-rspec guard-spork guard-livereload guard-bundler guard-pow guard-rake guard-process guard-chef ],
        :osx_text        => %w[ nokogiri erubis i18n tilt bluecloth haml compass ],
        :osx_cloud       => %w[ chef ohai ironfan fog right_aws vagrant veewee ],
      }
    }
  })
