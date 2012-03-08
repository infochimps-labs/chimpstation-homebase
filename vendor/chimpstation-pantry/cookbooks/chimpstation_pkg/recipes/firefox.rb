include_recipe  'dmg'

dmg_package 'Firefox' do
  source        node[:chimpstation_pkg][:firefox][:release_url]
  checksum      node[:chimpstation_pkg][:firefox][:checksum]
  action        :install

  ignore_failure true
end
