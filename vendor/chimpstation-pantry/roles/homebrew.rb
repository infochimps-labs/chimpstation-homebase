name        "homebrew"
description "Chimpstation OSX: installs and configures the homebrew package manager"

run_list(*%w[
  role[homebrew]
  ])
