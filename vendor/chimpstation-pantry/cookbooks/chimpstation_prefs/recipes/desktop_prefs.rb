execute "set dock to be on left" do
  command "defaults write com.apple.dock orientation -string left"
  user $ws_user
end

execute "set dock to autohide" do
  command "defaults write com.apple.dock autohide -boolean true"
  user $ws_user
end

execute "relaunch dock" do
  command "killall Dock"
end

dock = service "com.apple.Dock.agent"

defaults "com.apple.dock", "no-glass" do
  value node[:apple][:dock][:no_glass]
  notifies :restart, dock, :delayed
end

defaults "com.apple.dock", "orientation" do
  value node[:apple][:dock][:orientation]
  notifies :restart, dock, :delayed
end

defaults "com.apple.dock", "autohide" do
  value node[:apple][:dock][:autohide]
  notifies :restart, dock, :delayed
end
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
  :tl => :all_windows,
  :tr => :dashboard,
  :br => :noop,
  :bl => :noop
}

corners.each do |corner, value|
  execute "#{corner} right #{value}" do
    command "defaults write com.apple.dock wvous-#{corner}-corner -int #{active_corner_value_to_int[value]}"
    user $ws_user
  end
  execute "#{corner} modifier" do
    command "defaults write com.apple.dock wvous-#{corner}-modifier -int 0"
    user $ws_user
  end
end

execute "relaunch dock" do
  command "killall Dock"
end
