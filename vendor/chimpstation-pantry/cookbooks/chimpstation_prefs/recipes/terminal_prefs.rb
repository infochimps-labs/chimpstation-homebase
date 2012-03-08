execute "set terminal color scheme" do
  command "defaults write com.apple.Terminal 'Startup Window Settings' -string #{node['terminal']['color_scheme']}"
  user $ws_user
end

defaults "com.apple.Terminal", "Shell" do
  value node[:apple][:terminal][:shell]
end



defaults "com.apple.Terminal", "Shell" do
  value node[:apple][:terminal][:shell]
end


execute "turn on focus-follows-mouse for terminal" do
  command "defaults write com.apple.Terminal FocusFollowsMouse -string YES"
  user $ws_user
end
