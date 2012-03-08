name        "osx_prefs"
description "Chimpstation: Mac OSX-specific dotfiles / system preferences / etc."

run_list(*%w[
  chimpstation_prefs::user_interface_prefs

  chimpstation_prefs::terminal_prefs
  chimpstation_prefs::finder_prefs
  chimpstation_prefs::keyboard_prefs
  chimpstation_prefs::screensaver_prefs
  chimpstation_prefs::trackpad_prefs
  ])

default_attributes({
  })
