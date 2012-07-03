#
# An example cluster file template. CANNOT be used as-is.
# Copy to config/${chef_cluster}.rb and modify to suit your needs.
#
# We recommend having one cluster that logically groups all your machines.
# If you have more than one machine, then the simplest route is to put
# each one in its own facet.
#
Ironfan.cluster '${chef_cluster}' do

  environment           :ws

  role   :chimpstation_base
  role   :chimpstation_prefs
  role   :homebrew
  role   :osx_chef_dev

#  role   :osx_base
#  role   :osx_consistent_ux
#  role   :osx_data_miner
#  role   :osx_web_dev
#  role   :ironfan_ci_master

  facet :${chef_facet} do
    server(0).name   '${chef_facet}'
     facet_role.override_attributes({
      :chef_server => {
        :user => '${chef_server_user}',
        :group => 'staff',
        :manage_user_action => 'nothing',
        :webui_enabled => true,
      }
    })
  end
end
