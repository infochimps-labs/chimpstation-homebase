
template File.join(ENV['HOME'], 'Library/Preferences/com.apple.Terminal.plist') do
  source        'com.apple.Terminal.plist.erb'
  owner         $ws_user
  group         'admin'
  action        :create
end

osx_defaults "com.apple.Terminal", "Default Window Settings" do
  value         node[:osx_prefs][:terminal][:theme]
end

osx_defaults "com.apple.Terminal", "Startup Window Settings" do
  value         node[:osx_prefs][:terminal][:theme]
end

#
# src=$HOME/Library/Preferences/com.apple.Terminal.plist ; dest=$HOME/ics/sysadmin/chimpstation/cookbooks/chimpstation_prefs/templates/default/com.apple.Terminal.plist.erb  ; cp $src $dest ; plutil -convert xml1 $dest
