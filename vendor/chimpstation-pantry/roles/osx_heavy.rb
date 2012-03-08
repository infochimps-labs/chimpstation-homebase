name        "osx_heavy"
description "Chimpstation: The kitchen sink"

run_list(*%w[
  ])

default_attributes({
  })

override_attributes({
    # Package sets to install. Add or remove as convenience & prudence dictate.
    :package_set => {
      :install     => %w[ osx_backend ],
      }
  })
