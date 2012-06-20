#
# Sandbox cluster -- use this for general development
#
Ironfan.cluster 'workstation' do

  environment           :ws

  role   :chimpstation_base
  role   :chimpstation_prefs

  role   :homebrew

  role   :osx_base
  role   :osx_consistent_ux

  facet :flip do
    server(0).name   'worblehat'
    role   :user_flip
    #
    role   :osx_chef_dev
    role   :osx_data_miner
    role   :osx_web_dev
    #
    role   :ironfan_ci_master
  end

  facet :travis do
  end

  facet :sya do
  end

  facet :jbro do
  end

  facet :aseever do
  end

  facet :dieterich do
  end

  facet :huston do
  end

end
