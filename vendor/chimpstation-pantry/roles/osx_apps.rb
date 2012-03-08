name        "osx_apps"
description "Chimpstation: Mac OS X applications."

run_list(*%w[
  chimpstation_pkg::github_for_mac
  ])

default_attributes({
    :package_set => {
      :install     => %w[ !merge: ], # blows away the (debian-centric) default
    },
  })
