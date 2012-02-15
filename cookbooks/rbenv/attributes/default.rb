default.rbenv[:user]     = ENV['SUDO_USER'] || ENV['USER']
default.rbenv[:root]     = ENV['RBENV_ROOT'] || "#{ENV['HOME']}/.rbenv"
default.rbenv[:versions] = []
