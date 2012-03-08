# -*- coding: utf-8 -*-

#
# Keyboard
#

domain = "~/Library/Preferences/.GlobalPreferences"
osx_defaults(domain, 'KeyRepeat'       ){ value node[:osx_prefs][:keyboard][:key_repeat_delay] }
osx_defaults(domain, 'InitialKeyRepeat'){ value node[:osx_prefs][:keyboard][:initial_repeat_delay] }

# Enable full keyboard access for all controls (e.g. enable Tab in modal dialogs)
osx_defaults('NSGlobalDomain', "AppleKeyboardUIMode" ){ value 3 }

# Disable press-and-hold for keys in favor of key repeat
osx_defaults('NSGlobalDomain', "ApplePressAndHoldEnabled"      ){ value 'false' }

# Set a blazingly fast keyboard repeat rate
osx_defaults('NSGlobalDomain', "KeyRepeat"     ){ value '0' }

# Disable auto-correct
osx_defaults('NSGlobalDomain', "NSAutomaticSpellingCorrectionEnabled"  ){ value 'false' }


#
# Trackpad
#

domain = 'com.apple.driver.AppleBluetoothMultitouch.trackpad'
osx_defaults(domain, 'Clicking' ){ value node[:osx_prefs][:trackpad][:clicking_by_touch] }
osx_defaults(domain, 'Dragging' ){ value node[:osx_prefs][:trackpad][:dragging_by_touch] }
# Map bottom right Trackpad corner to right-click
osx_defaults(domain,    "TrackpadCornerSecondaryClick"  ){ value '2' }
osx_defaults(domain,    "TrackpadRightClick"            ){ value 'true' }

#
# Dock
#

dock = service("com.apple.Dock.agent"){ service_name "com.apple.Dock" }
domain = 'com.apple.dock'

osx_defaults(domain, "no-glass"    ){ value node[:osx_prefs][:dock][:no_glass]    ; notifies(:restart, dock, :delayed) }
osx_defaults(domain, "orientation" ){ value node[:osx_prefs][:dock][:orientation] ; notifies(:restart, dock, :delayed) }
osx_defaults(domain, "autohide"    ){ value node[:osx_prefs][:dock][:autohide]    ; notifies(:restart, dock, :delayed) }


# Enable the 2D Dock
osx_defaults('com.apple.dock',                          "no-glass"      ){ value 'true' }

# Automatically hide and show the Dock
osx_defaults('com.apple.dock',                          "autohide"      ){ value 'true' }

# Make Dock icons of hidden applications translucent
osx_defaults('com.apple.dock',                          "showhidden"    ){ value 'true' }

# Enable highlight hover effect for the grid view of a stack (Dock)
osx_defaults('com.apple.dock',                          "mouse-over-hilte-stack"        ){ value 'true' }

# Enable spring loading for all Dock items
osx_defaults('com.apple.doc',                           "enable-spring-load-actions-on-all-items"       ){ value 'true' }

# Show indicator lights for open applications in the Dock
osx_defaults('com.apple.dock',                          "show-process-indicators"       ){ value 'true' }

# Don’t animate opening applications from the Dock
osx_defaults('com.apple.dock',                          "launchanim"    ){ value 'false' }


#
# Hot Corners
#

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
  :tl => :mission_control,
  :tr => :desktop,
  :br => :all_windows,
  :bl => :all_windows,
}

corners.each do |corner, value|
  osx_defaults(domain, "wvous-#{corner}-corner"  ){ value active_corner_value_to_int[value] ; notifies(:restart, dock, :delayed) }
  osx_defaults(domain, "wvous-#{corner}-modifier"){ value 0                                 ; notifies(:restart, dock, :delayed) }
end


#
# UI Display Preferences
#


# Enable subpixel font rendering on non-Apple LCDs
osx_defaults('NSGlobalDomain',                          "AppleFontSmoothing"    ){ value '2' }

# Disable menu bar transparency
osx_defaults('NSGlobalDomain',                          "AppleEnableMenuBarTransparency"        ){ value 'false' }

# Show remaining battery time; hide percentage
osx_defaults('com.apple.menuextra.battery',             "ShowPercent"   ){ value '"NO"' }
osx_defaults('com.apple.menuextra.battery',             "ShowTime"      ){ value '"YES"' }

# Always show scrollbars
osx_defaults('NSGlobalDomain',                          "AppleShowScrollBars"   ){ value '"Always"' }

# # Disable window animations
# osx_defaults('NSGlobalDomain',                        "NSAutomaticWindowAnimationsEnabled"    ){ value 'false' }

# Enable AirDrop over Ethernet and on unsupported Macs running Lion
osx_defaults('com.apple.NetworkBrowser',                "BrowseAllInterfaces"   ){ value 'true' }

# Increase window resize speed for Cocoa applications
osx_defaults('NSGlobalDomain',                          "NSWindowResizeTime"    ){ value '0.001' }
