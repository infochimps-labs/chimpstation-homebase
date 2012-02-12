name        "cstn_base"
description "Chimpstation: base config"

run_list(
  "recipe[homebrew]",
  "recipe[package_set]"
  )


default_attributes({
    # Package sets to install. Add or remove as convenience & prudence dictate.
    :package_set => {
      :install     => %w[ base dev libs sysadmin editors chef_server web_dev backend testing langs text cloud ],
      :pkgs        => {
        
        :base        => [
          "readline", "binutils", "coreutils", "findutils", "patchutils", "proctools",
          "zsh", "bash", "bash-completion", ],

        :dev         => [
          "git", "git-subtree", "git-utils", "subversion", "ctags", "gnu-indent", "gnu-sed",
          "gnu-tar", "gnu-time", "sqlite", "ack", "colordiff", "csshx", "ctags", "curl",
          "elinks", "growlnotify", "lesspipe", "pigz", "tmux", "tree", "wget", ],

        :libs        => [
          "bcrypt", "gettext", "libevent", "libexif", "libffi", "libgcrypt", "libgit2",
          "libgpg-error", "libgsasl", "libident", "libidn", "librsync", "libssh2",
          "libxml2", "libxslt", "libyaml", "libzip", "oniguruma", "openssl", "pcre",
          "ragel", "snappy", "neon", "base64", "dos2unix", "lzlib", "lzo", "md5deep", ],

        :sysadmin    => [
          "htop", "httperf", "ifstat", "imlib2", "ncftp", "netcat", "nmap", "tcpstat",
          "tcptrace", "pstree", "ssh-copy-id", "watch", "imagemagick", ],

        :editors     => [ "emacs", "macvim", ],
        :chef_server => [ "rabbitmq", "couchdb", ],
        :web_dev     => [ "nginx", "pow", "coffee-script", "node", ],

        :backend     => [ "elasticsearch", "flume", "hadoop", "hbase", "hive", "pig", "redis", "redis-tools", "mongodb", "nginx", "pow", ],
        :backend_2   => [ "cassandra", "couchdb", "jenkins", "postgresql", "rabbitmq", "syslog-ng", "varnish", "zeromq" ],

        :langs       => [ "coffee-script", "gradle", "lua", "luarocks", "node", "phantomjs", "python3", "r", "v8", ],
        :cloud       => [ "aws-iam-tools", "ec2-ami-tools", "ec2-api-tools", "elb-tools", "s3cmd", "s3sync", ],

      },
      :gems          => {
        
        :base        => %w[ bundler jeweler thor yard ],
        :dev         => %w[
          rails extlib json crack yajl-ruby addressable rest-client 
          awesome_print pry wirble hirb cheat guard watchr highline formatador gist qwandry
          configliere gorillib wukong ],
        :sysadmin    => %w[],
        :chef_server => %w[ chef chef-server-api chef-server-webui chef-solr chef-expander ],
        :web_dev     => %w[ sinatra gollum jekyll powder ],
        :testing     => %w[ rspec cucumber
                          guard guard-rspec guard-spork guard-livereload guard-bundler guard-pow guard-rake guard-process guard-chef ], 
        :text        => %w[ nokogiri erubis i18n tilt bluecloth haml compass ],
        :cloud       => %w[ chef ohai cluster_chef fog right_aws vagrant veewee ],
      }
    }
  })

    


