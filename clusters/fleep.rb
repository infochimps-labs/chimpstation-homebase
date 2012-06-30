#
# Flip's boxen
#
Ironfan.cluster 'fleep' do

  environment           :ws

  role   :chimpstation_base
  role   :chimpstation_prefs
  role   :homebrew
  role   :osx_chef_dev
  # role   :user_flip

  role   :homebrew

  # role   :osx_base
  # role   :osx_consistent_ux

  role   :osx_chef_dev
  # role   :osx_data_miner
  # role   :osx_web_dev

  # role   :ironfan_ci_master

  facet :worblehat do
    server(0).name   'worblehat'
  end

  cluster_role.override_attributes({
      # set this to YOUR username on the local machine
      :chef_server => { :user => 'flip', }
    })

end
