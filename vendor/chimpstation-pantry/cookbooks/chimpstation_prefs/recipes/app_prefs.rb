
#
# Finder
#

domain = "com.apple.finder"
osx_defaults(domain, "_FXShowPosixPathInTitle"){ value node[:osx_prefs][:finder][:show_full_path] }
osx_defaults(domain, "ShowHardDrivesOnDesktop"){ value node[:osx_prefs][:finder][:show_hard_drives] }

# osx_defaults(domain, "AppleShowAllFiles"      ){ value node[:osx_prefs][:finder][:show_all_files] }
# osx_defaults(domain, "ShowStatusBar"){ value node[:osx_prefs][:finder][:show_hard_drives] }
# osx_defaults(domain, "ShowHardDrivesOnDesktop"){ value node[:osx_prefs][:finder][:show_hard_drives] }

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
osx_defaults(domain, "Default Window Settings"){ value node[:osx_prefs][:terminal][:theme] }
osx_defaults(domain, "Startup Window Settings"){ value node[:osx_prefs][:terminal][:theme] }

#
# Safari
#

domain = "com.apple.safari"
osx_defaults(domain, "AutoFillPasswords"             ){ value node[:osx_prefs][:safari][:auto_fill_passwords] }
osx_defaults(domain, "HistoryAgeInDaysLimit"         ){ value node[:osx_prefs][:safari][:history_limit] }

osx_defaults(domain, "WarnAboutFraudulentWebsites"   ){ value true }
osx_defaults(domain, "WebKitTabToLinksPreferenceKey" ){ value true }
osx_defaults(domain, "WebKitFixedFont"               ){ value 'Menlo' }

osx_defaults(domain, "IncludeDebugMenu"              ){ value node[:osx_prefs][:safari][:show_debug_menu]    } 
osx_defaults(domain, "IncludeDevelopMenu"            ){ value node[:osx_prefs][:safari][:show_develop_menu]  }
osx_defaults(domain, "ShowFavoritesBar"              ){ value node[:osx_prefs][:safari][:show_favorites_bar] }
osx_defaults(domain, "ShowStatusBar"                 ){ value node[:osx_prefs][:safari][:show_status_bar]    }
osx_defaults(domain, "AlwaysShowTabBar"              ){ value node[:osx_prefs][:safari][:show_tab_bar]       }
