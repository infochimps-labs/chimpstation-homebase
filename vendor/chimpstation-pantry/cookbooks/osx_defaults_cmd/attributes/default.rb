default[:osx_defaults][:user]      = ENV['SUDO_USER'] || ENV['USER']

default[:osx_defaults][:dock]      = Mash.new
default[:osx_defaults][:safari]    = Mash.new
default[:osx_defaults][:terminal]  = Mash.new
