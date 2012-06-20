include_recipe  'dmg'

dmg_package 'Google Chrome' do
  dmg_name      "googlechrome"
  source        node[:chimpstation_pkg][:chrome][:release_url]
  checksum      node[:chimpstation_pkg][:chrome][:checksum]
  action        :install

  ignore_failure true
end
