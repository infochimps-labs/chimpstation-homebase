execute "set finder to display full path in title bar" do
  command "defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES"
  user $ws_user
end

execute "show hard drive on desktop" do
  command "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool YES"
  user $ws_user
end
