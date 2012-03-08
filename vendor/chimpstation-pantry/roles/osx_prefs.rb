name        "osx_prefs"
description "Chimpstation: Mac OSX-specific dotfiles / system preferences / etc."

run_list(*%w[
  chimpstation_prefs::desktop_prefs
  chimpstation_prefs::terminal_prefs
  ])

default_attributes({
  })
