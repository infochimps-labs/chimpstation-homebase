name        "osx_base"
description "Chimpstation OSX: apps and packages applied to all Mac OS X systems."

run_list(
  'osx_prefs',
  'role[osx_package_set_definitions]',
  'emacs',
  'osx_apps::macvim',
  )

default_attributes({
    :cloud => { :private_ips     => ['33.33.33.1'], :local_ipv4 => '33.33.33.1', }
  })
