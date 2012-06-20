include_recipe  'dmg'

dmg_package 'LibreOffice' do
  volumes_dir   "LibreOffice 3.3"
  source        node[:chimpstation_pkg][:libreoffice][:release_url]
  checksum      node[:chimpstation_pkg][:libreoffice][:checksum]
  action        :install
end
