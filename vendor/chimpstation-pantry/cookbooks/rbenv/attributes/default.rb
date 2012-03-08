default[:rbenv][:user]     = ENV['SUDO_USER'] || ENV['USER']
default[:rbenv][:conf_dir] = ENV['RBENV_ROOT'] || "#{ENV['HOME']}/.rbenv"

default[:rbenv][:versions] = [
  # '1.9.3-p0',
  # '1.8.7-p352'
]
default[:rbenv][:global]   = false
