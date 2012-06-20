# -*- coding: utf-8 -*-

#
# Finder
#

domain = "com.apple.finder"

# Display full POSIX path as Finder window title
osx_defaults(domain, "_FXShowPosixPathInTitle"   ){ value node[:osx_prefs][:finder][:show_full_path] }
osx_defaults(domain, "ShowHardDrivesOnDesktop"   ){ value node[:osx_prefs][:finder][:show_hard_drives] }
# osx_defaults(domain, "AppleShowAllFiles"       ){ value node[:osx_prefs][:finder][:show_all_files] }
# osx_defaults(domain, "ShowStatusBar"           ){ value node[:osx_prefs][:finder][:show_status_bar] }
# osx_defaults(domain, "ShowHardDrivesOnDesktop" ){ value node[:osx_prefs][:finder][:show_hard_drives] }

#
# Global Domain
#

domain = 'NSGlobalDomain'

# Show all filename extensions in Finder
osx_defaults(domain, "AppleShowAllExtensions"             ){ value true }
# Expand save panel by default
osx_defaults(domain, "NSNavPanelExpandedStateForSaveMode" ){ value true }
# Expand print panel by default
osx_defaults(domain, "PMPrintingExpandedStateForPrint"    ){ value true }
# Don't re-open all my windows every time I restart an app
osx_defaults(domain, "NSQuitAlwaysKeepsWindows"           ){ value false }

#
# other
#

# # The “Are you sure you want to open this application?” dialog
osx_defaults('com.apple.LaunchServices', "LSQuarantine" ){ value true }
# Avoid creating .DS_Store files on network volumes
osx_defaults('com.apple.desktopservices',  "DSDontWriteNetworkStores"   ){ value true }
# Automatically open a new Finder window when a volume is mounted
osx_defaults('com.apple.frameworks.diskimages', "auto-open-ro-root"     ){ value true }
osx_defaults('com.apple.frameworks.diskimages', "auto-open-rw-root"     ){ value true }
# Enable AirDrop over Ethernet and on unsupported Macs running Lion
osx_defaults('com.apple.NetworkBrowser',    "BrowseAllInterfaces"   ){ value true }
# Show remaining battery time; hide percentage
osx_defaults('com.apple.menuextra.battery', "ShowPercent"   ){ value false }
osx_defaults('com.apple.menuextra.battery', "ShowTime"      ){ value true }

#
# FIXME: these need sudo
#

# # System Info, Hostname & Version on Login Screen (must click on Clock to see hostname & version info)
# osx_defaults('/Library/Preferences/com.apple.loginwindow', "AdminHostInfo" ){ value 'HostName' }
# # Enable logon to Novell & other Pre Lion Mac-OS-X NAS-shares (requires restart)
# # Note: after you restart, connect to an AFP server -- it will create some magic files that complete the setup.
# osx_defaults('/Library/Preferences/com.apple.AppleShareClient', "afp_host_prefs_version" ){ value 1 }
#
# Show item info below desktop icons :TODO:
# /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" ~/Library/Preferences/com.apple.finder.plist
# # Show the ~/Library folder :TODO:
# chflags nohidden ~/Library
# # Disable local Time Machine backups :TODO:
# sudo tmutil enablelocal

#
# Safari
#

domain = "com.apple.safari"
osx_defaults(domain, "AutoFillPasswords"              ){ value node[:osx_prefs][:safari][:auto_fill_passwords] }
osx_defaults(domain, "HistoryAgeInDaysLimit"          ){ value node[:osx_prefs][:safari][:history_limit] }

osx_defaults(domain, "WarnAboutFraudulentWebsites"    ){ value true }
osx_defaults(domain, "WebKitTabToLinksPreferenceKey"  ){ value true }
osx_defaults(domain, "WebKitFixedFont"                ){ value 'Menlo' }

osx_defaults(domain, "IncludeDebugMenu"               ){ value node[:osx_prefs][:safari][:show_debug_menu]    }
osx_defaults(domain, "IncludeDevelopMenu"             ){ value node[:osx_prefs][:safari][:show_develop_menu]  }
osx_defaults(domain, "ShowFavoritesBar"               ){ value node[:osx_prefs][:safari][:show_favorites_bar] }
osx_defaults(domain, "ShowStatusBar"                  ){ value node[:osx_prefs][:safari][:show_status_bar]    }
osx_defaults(domain, "AlwaysShowTabBar"               ){ value node[:osx_prefs][:safari][:show_tab_bar]       }

#
# iTunes
#

# Disable the Ping sidebar in iTunes
osx_defaults('com.apple.iTunes', "disablePingSidebar" ){ value true }
# Disable all the other Ping stuff in iTunes
osx_defaults('com.apple.iTunes', "disablePing"        ){ value true }
