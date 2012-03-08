include_recipe  'dmg'

dmg_package "chrome" do
  dmg_name      "googlechrome"
  source        node[:chimpstation_pkg][:chrome][:release_url]
  checksum      node[:chimpstation_pkg][:chrome][:checksum]
  action        :install
end
