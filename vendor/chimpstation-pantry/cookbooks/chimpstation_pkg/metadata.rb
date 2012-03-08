maintainer       "Philip (flip) Kromer - Infochimps, Inc"
maintainer_email "coders@infochimps.com"
license          "Apache 2.0"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "3.1.0"

description      "OSX Workstation packages"

depends          "install_from"
depends          "homebrew"
depends          "dmg"

recipe           "chimpstation_pkg::github_for_mac",   "Installs the github_for_mac application"

%w[ mac_os_x ].each do |os|
  supports os
end
