name        "osx_base"
description "Chimpstation: role applied to all Mac OS X systems."

run_list(*%w[
  recipe[homebrew]
  ])

default_attributes({
  })
