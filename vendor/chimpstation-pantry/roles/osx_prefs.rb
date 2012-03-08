name        "osx_prefs"
description "Chimpstation: Mac OSX-specific dotfiles / system preferences / etc."

run_list(*%w[
  chimpstation_prefs::app_prefs
  chimpstation_prefs::screensaver_prefs
  chimpstation_prefs::service_prefs
  chimpstation_prefs::user_interface_prefs

  chimpstation_prefs::mute_rubygems_deprecations
  ])
#  chimpstation_prefs::rename_machine

default_attributes({
  })
