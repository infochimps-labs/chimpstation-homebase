#
# An example cluster file template. CANNOT be used as-is.
# Copy to config/selenium.rb and modify to suit your needs.
#
# We recommend having one cluster that logically groups all your machines.
# If you have more than one machine, then the simplest route is to put
# each one in its own facet.
#

# Change selenium to the name of your cluster
Ironfan.cluster 'selenium' do

  environment           :ws

  # required roles
  role   :chimpstation_base
  role   :chimpstation_prefs
  role   :homebrew
  
  # optional roles
  role   :osx_chef_dev
#  role   :osx_base
#  role   :osx_consistent_ux
#  role   :osx_data_miner
#  role   :osx_web_dev
#  role   :ironfan_ci_master

  # change futhark to the name of your facet
  facet :futhark do
     facet_role.override_attributes({
      :chef_server => {
        :user => 'selene',
        :group => 'staff',
        :manage_user_action => 'nothing',
        :webui_enabled => true,
      }
    })
  end
end
