name        "osx_web_dev"
description "Chimpstation OSX: apps and packages for web development"

run_list(
  # 'osx_apps::chrome',
  # 'osx_apps::firefox',
  # 'osx_apps::mongodb',
  # 'osx_apps::mysql'
  )

default_attributes({
    # :package_set => { :install => %w[ osx_web_dev ], },
  })
