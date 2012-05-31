include_recipe  'dmg'

dmg_package 'Crash Plan' do
  volumes_dir   "Crash Plan Installer"
  source        node[:chimpstation_pkg][:crash_plan][:release_url]
  checksum      node[:chimpstation_pkg][:crash_plan][:checksum] unless node[:chimpstation_pkg][:crash_plan][:checksum].empty?
  action        :install
end
