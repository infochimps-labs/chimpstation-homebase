
#
# Keyboard
#

domain = "~/Library/Preferences/.GlobalPreferences"
osx_defaults(domain, 'KeyRepeat'       ){ value node[:osx_prefs][:keyboard][:key_repeat_delay] }
osx_defaults(domain, 'InitialKeyRepeat'){ value node[:osx_prefs][:keyboard][:initial_repeat_delay] }

#
# Trackpad
#

domain = 'com.apple.driver.AppleBluetoothMultitouch.trackpad'
osx_defaults(domain, 'Clicking' ){ value node[:osx_prefs][:trackpad][:clicking_by_touch] }
osx_defaults(domain, 'Dragging' ){ value node[:osx_prefs][:trackpad][:dragging_by_touch] }

#
# Dock
#

dock = service("com.apple.Dock.agent"){ service_name "com.apple.Dock" }
domain = 'com.apple.dock'

osx_defaults(domain, "no-glass"    ){ value node[:osx_prefs][:dock][:no_glass]    ; notifies(:restart, dock, :delayed) }
osx_defaults(domain, "orientation" ){ value node[:osx_prefs][:dock][:orientation] ; notifies(:restart, dock, :delayed) }
osx_defaults(domain, "autohide"    ){ value node[:osx_prefs][:dock][:autohide]    ; notifies(:restart, dock, :delayed) }

active_corner_value_to_int = {
  desktop:               4,
  dashboard:             7,
  mission_control:       2,
  application_windows:   3,
  launchpad:            11,
  start_screen_saver:    5,
  disable_screen_saver:  6,
  put_display_to_sleep: 10,
  noop:                  0
}

corners = {
  :tl => :mission_control,
  :tr => :desktop,
  :br => :all_windows,
  :bl => :all_windows,
}

corners.each do |corner, value|
  osx_defaults(domain, "wvous-#{corner}-corner"  ){ value active_corner_value_to_int[value] ; notifies(:restart, dock, :delayed) }
  osx_defaults(domain, "wvous-#{corner}-modifier"){ value 0                                 ; notifies(:restart, dock, :delayed) }
end
