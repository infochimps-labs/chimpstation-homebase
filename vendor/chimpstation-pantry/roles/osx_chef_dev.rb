name        "osx_chef_dev"
description "Chimpstation OSX: apps and packages for chef development"

run_list(*%w[
    osx_apps::virtualbox
  ])

default_attributes({
  })
