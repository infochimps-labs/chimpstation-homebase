include_recipe  'dmg'

dmg_package 'KeyCastr' do
  dmg_name      "KeyCastr"
  source        node[:chimpstation_pkg][:keycastr][:release_url]
  checksum      node[:chimpstation_pkg][:keycastr][:checksum]
  action        :install

  ignore_failure true
end
