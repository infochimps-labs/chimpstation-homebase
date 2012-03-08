include_recipe  'dmg'

dmg_package "skype" do
  source        node[:chimpstation_pkg][:skype][:release_url]
  checksum      node[:chimpstation_pkg][:skype][:checksum]
  action        :install
end
