name        "osx_prefs"
description "Chimpstation: Mac OSX-specific dotfiles / system preferences / etc."

run_list(
  # 'osx_prefs::consistent_app_prefs',
  'osx_prefs::consistent_terminal_keybindings',
  'osx_prefs::consistent_user_interface',
  # 'osx_prefs::enable_file_locate',
  # 'osx_prefs::enable_ssh',
  'osx_prefs::screensaver_requires_password',
  )
