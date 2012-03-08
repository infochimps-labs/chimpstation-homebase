include_recipe  'dmg'

dmg_package 'Skype' do
  source        node[:chimpstation_pkg][:skype][:release_url]
  checksum      node[:chimpstation_pkg][:skype][:checksum]
  action        :install

  ignore_failure true
end
