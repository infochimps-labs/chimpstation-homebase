execute "show hard drive on desktop" do
  command "defaults write com.apple.finder ShowHardDrivesOnDesktop -bool YES"
  user $ws_user
end
