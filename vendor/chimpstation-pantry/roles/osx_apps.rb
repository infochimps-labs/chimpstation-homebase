name        "osx_apps"
description "Chimpstation: Mac OS X applications."

run_list(*%w[
  chimpstation_pkg::git
  chimpstation_pkg::zsh

  chimpstation_pkg::chrome
  chimpstation_pkg::dropbox
  chimpstation_pkg::firefox
  chimpstation_pkg::github_for_mac
  chimpstation_pkg::skype
  chimpstation_pkg::virtualbox
  chimpstation_pkg::gitx
  chimpstation_pkg::keycastr

  chimpstation_pkg::screensharing
  ])

  # chimpstation_pkg::java_osx
  # chimpstation_pkg::mongodb
  # chimpstation_pkg::mysql
  # chimpstation_pkg::libreoffice

default_attributes({
    :package_set => {
      :install     => %w[ !merge: ], # blows away the (debian-centric) default
    },
  })
