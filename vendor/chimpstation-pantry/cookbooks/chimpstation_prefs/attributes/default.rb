default[:osx_prefs][:user]      = ENV['SUDO_USER'] || ENV['USER']

default[:osx_prefs][:dock]      = Mash.new
default[:osx_prefs][:safari]    = Mash.new
default[:osx_prefs][:terminal]  = Mash.new


default[:osx_prefs][:terminal][:theme] = 'solarized-dark'


default[:osx_prefs][:dock][:orientation] = 'right'
default[:osx_prefs][:dock][:autohide]    = true
default[:osx_prefs][:dock][:no_glass]    = true
