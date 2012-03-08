include_recipe  'dmg'

dmg_package 'java_osx' do
  volumes_dir   "Java for Mac OS X 10.7"
  type          "mpkg"
  package_id    "com.apple.pkg.JavaForMacOSX107"
  source        node[:chimpstation_pkg][:java_osx][:release_url]
  checksum      node[:chimpstation_pkg][:java_osx][:checksum]
  action        :install
end
