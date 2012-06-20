#
# Terminal
#

template File.join(ENV['HOME'], 'Library/Preferences/com.apple.Terminal.plist') do
  source        'com.apple.Terminal.plist.erb'
  owner         $ws_user
  group         'admin'
  action        :create
end
# src=$HOME/Library/Preferences/com.apple.Terminal.plist ; dest=$HOME/ics/sysadmin/chimpstation/cookbooks/chimpstation_prefs/templates/default/com.apple.Terminal.plist.erb  ; cp $src $dest ; plutil -convert xml1 $dest

domain = "com.apple.Terminal"
# Window theme
osx_defaults(domain, "Default Window Settings"){ value node[:osx_prefs][:terminal][:theme] }
osx_defaults(domain, "Startup Window Settings"){ value node[:osx_prefs][:terminal][:theme] }
# Only use UTF-8 in Terminal.app
osx_defaults(domain, "StringEncodings"        ){ value 4 }

# Tell terminal not to restore screen buffer (kills battery)
osx_defaults('com.apple.Terminal', "NSQuitAlwaysKeepsWindows"      ){ value false }
