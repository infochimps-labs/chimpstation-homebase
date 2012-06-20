name        "osx_base"
description "Chimpstation: role applied to all Mac OS X systems."

run_list(*%w[

  role[osx_package_set_definitions]
  emacs
  osx_apps::macvim

  ])

default_attributes({
    :package_set => { :install => %w[ osx_base osx_libs osx_cloud ], }
  })
