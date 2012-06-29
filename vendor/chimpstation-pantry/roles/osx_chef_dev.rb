name        "osx_chef_dev"
description "Chimpstation OSX: apps and packages for chef development"

run_list(
    'osx_apps::virtualbox',
    'role[chef_server]'
  )
