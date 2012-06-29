#
# Dieterich's boxen
#
Ironfan.cluster 'ducats' do

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

  cluster_role.override_attributes({
    :chef_server => {
      :manage_user_action => 'nothing',
    }
  })

  facet :dunit do
    server(0).name   'dunit'
     facet_role.override_attributes({
      :chef_server => {
        :user => 'dieterichlawson',
        :group => 'staff',
        :manage_user_action => 'nothing',
        :webui_enabled => true,
      }
    })
  end

  facet :coolhand do
    server(0).name   'coolhand'
    facet_role.override_attributes({
      :chef_server => {
        :user => 'dlaw',
        :group => 'staff',
        :manage_user_action => 'nothing',
        :webui_enabled => true,
      }
    })
  end

end
