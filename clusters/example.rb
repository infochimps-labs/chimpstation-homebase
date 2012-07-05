#
# An example cluster file template. CANNOT be used as-is.
# Copy to config/ducats.rb and modify to suit your needs.
#
# We recommend having one cluster that logically groups all your machines.
# If you have more than one machine, then the simplest route is to put
# each one in its own facet.
#

# Change ${chef_cluster} to the name of your cluster
Ironfan.cluster '${chef_cluster}' do

  environment           :ws

  # required roles
  role   :chimpstation_base
  role   :chimpstation_prefs
  role   :homebrew
  
  # optional roles
#  role   :osx_chef_dev
#  role   :osx_base
#  role   :osx_consistent_ux
#  role   :osx_data_miner
#  role   :osx_web_dev
#  role   :ironfan_ci_master

  # change ${chef_facet} to the name of your facet
  facet :${chef_facet} do
    # change this too
    server(0).name   '${chef_facet}'
     facet_role.override_attributes({
      :chef_server => {
       #set this to YOUR username on your local machine
        :user => '${local_user}',
        :group => 'staff',
        :manage_user_action => 'nothing',
        :webui_enabled => true,
      }
    })
  end
end
