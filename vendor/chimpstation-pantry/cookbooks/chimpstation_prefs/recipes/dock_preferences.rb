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
