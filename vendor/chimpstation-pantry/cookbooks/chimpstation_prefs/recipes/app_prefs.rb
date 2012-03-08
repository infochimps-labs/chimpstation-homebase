# -*- coding: utf-8 -*-

#
# Finder
#

domain = "com.apple.finder"
osx_defaults(domain, "_FXShowPosixPathInTitle"){ value node[:osx_prefs][:finder][:show_full_path] }
osx_defaults(domain, "ShowHardDrivesOnDesktop"){ value node[:osx_prefs][:finder][:show_hard_drives] }

# osx_defaults(domain, "AppleShowAllFiles"      ){ value node[:osx_prefs][:finder][:show_all_files] }
# osx_defaults(domain, "ShowStatusBar"){ value node[:osx_prefs][:finder][:show_hard_drives] }
# osx_defaults(domain, "ShowHardDrivesOnDesktop"){ value node[:osx_prefs][:finder][:show_hard_drives] }

# # Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
# osx_defaults('com.apple.finder',                      "QuitMenuItem"	){ value 'true' }

# Show all filename extensions in Finder
osx_defaults('NSGlobalDomain',                          "AppleShowAllExtensions"	){ value 'true' }

# Expand save panel by default
osx_defaults('NSGlobalDomain',                          "NSNavPanelExpandedStateForSaveMode"	){ value 'true' }

# Expand print panel by default
osx_defaults('NSGlobalDomain',                          "PMPrintingExpandedStateForPrint"	){ value 'true' }

# # Disable the “Are you sure you want to open this application?” dialog
# osx_defaults('com.apple.LaunchServices',              "LSQuarantine"	){ value 'false' }

# # Disable shadow in screenshots
# osx_defaults('com.apple.screencapture',               "disable-shadow"	){ value 'true' }

# Avoid creating .DS_Store files on network volumes
osx_defaults('com.apple.desktopservices',                            	"DSDontWriteNetworkStores"	){ value 'true' }

# # Disable the warning when changing a file extension
# osx_defaults('com.apple.finder',                                   	"FXEnableExtensionChangeWarning"	){ value 'false' }

# Show item info below desktop icons
/usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist

# # Disable the warning before emptying the Trash
# osx_defaults('com.apple.finder',                                   	"WarnOnEmptyTrash"	){ value 'false' }

# # Empty Trash securely by default
# osx_defaults('com.apple.finder',                                   	"EmptyTrashSecurely"	){ value 'true' }

# Display full POSIX path as Finder window title
osx_defaults('com.apple.finder',                                     	"_FXShowPosixPathInTitle"	){ value 'true' }

# Disable disk image verification
osx_defaults('com.apple.frameworks.diskimages',                      	"skip-verify"	){ value 'true' }
osx_defaults('com.apple.frameworks.diskimages',                      	"skip-verify-locked"	){ value 'true' }
osx_defaults('com.apple.frameworks.diskimages',                      	"skip-verify-remote"	){ value 'true' }

# Automatically open a new Finder window when a volume is mounted
osx_defaults('com.apple.frameworks.diskimages',                      	"auto-open-ro-root"	){ value 'true' }
osx_defaults('com.apple.frameworks.diskimages',                      	"auto-open-rw-root"	){ value 'true' }

# # Disable Resume system-wide
# osx_defaults('NSGlobalDomain',                                     	"NSQuitAlwaysKeepsWindows"	){ value 'false' }

# # Enable Dashboard dev mode (allows keeping widgets on the desktop)
# osx_defaults('com.apple.dashboard',                                	"devmode"	){ value 'true' }

# System Info, Hostname & Version on Login Screen (must click on Clock to see hostname & version info)
osx_defaults('/Library/Preferences/com.apple.loginwindow',           	"AdminHostInfo"	){ value 'HostName' }

# Enable logon to Novell & other Pre Lion Mac-OS-X NAS-shares (requires restart)
# after restart, connect to any old AFP server (use "Connect To...") so it creates some magic files
osx_defaults('/Library/Preferences/com.apple.AppleShareClient',      	"afp_host_prefs_version"	){ value '1' }

# # Show the ~/Library folder
# chflags nohidden ~/Library

# # Disable local Time Machine backups
# sudo tmutil enablelocal

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

# # Only use UTF-8 in Terminal.app
# osx_defaults('com.apple.terminal',                    "StringEncodings"	){ value '4' }

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

# # Disable Safari’s thumbnail cache for History and Top Sites
# osx_defaults('com.apple.Safari',                      "DebugSnapshotsUpdatePolicy"	){ value '2' }

# Enable Safari’s debug menu
osx_defaults('com.apple.Safari',                        "IncludeDebugMenu"	){ value 'true' }

# # Remove useless icons from Safari’s bookmarks bar
# defaults write com.apple.Safari ProxiesInBookmarksBar "()"

#
# iTunes
#

# Disable the Ping sidebar in iTunes
osx_defaults('com.apple.iTunes',                        "disablePingSidebar"	){ value 'true' }

# Disable all the other Ping stuff in iTunes
osx_defaults('com.apple.iTunes',                        "disablePing"	){ value 'true' }

#
# Mail
#

# Disable send and reply animations in Mail.app
osx_defaults('com.apple.Mail',                          "DisableReplyAnimations"	){ value 'true' }
osx_defaults('com.apple.Mail',                          "DisableSendAnimations"	){ value 'true' }

