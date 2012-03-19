default[:osx_prefs][:user]      = ENV['SUDO_USER'] || ENV['USER']

default[:osx_prefs][:dock]      = Mash.new
default[:osx_prefs][:safari]    = Mash.new
default[:osx_prefs][:terminal]  = Mash.new


default[:osx_prefs][:terminal][:theme] = 'solarized-dark'


default[:osx_prefs][:dock][:orientation] = 'right'
default[:osx_prefs][:dock][:autohide]    = true
default[:osx_prefs][:dock][:no_glass]    = true

default[:osx_prefs][:finder][:show_full_path]   = true
default[:osx_prefs][:finder][:show_hard_drives] = true

default[:osx_prefs][:keyboard][:key_repeat_delay] = 0
default[:osx_prefs][:keyboard][:initial_repeat_delay] = 15


default[:osx_prefs][:trackpad][:clicking_by_touch] = false
default[:osx_prefs][:trackpad][:dragging_by_touch] = false

default[:osx_prefs][:screensaver][:lock_delay] = 60


default[:osx_prefs][:safari][:auto_fill_passwords] = true
default[:osx_prefs][:safari][:history_limit]       = 365000
#
default[:osx_prefs][:safari][:show_debug_menu]     = true
default[:osx_prefs][:safari][:show_develop_menu]   = true
default[:osx_prefs][:safari][:show_favorites_bar]  = true
default[:osx_prefs][:safari][:show_status_bar]     = true
default[:osx_prefs][:safari][:show_tab_bar]        = true


default[:osx_prefs][:locate][:prunepaths] = []
