include_recipe  'dmg'

dmg_package 'Dropbox' do
  volumes_dir   "Dropbox Installer"
  source        node[:chimpstation_pkg][:dropbox][:release_url]
  checksum      node[:chimpstation_pkg][:dropbox][:checksum]
  action        :install
end
