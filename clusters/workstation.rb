#
# Sandbox cluster -- use this for general development
#
Ironfan.cluster 'workstation' do

  environment           :ws

  role   :chimpstation_base
  role   :chimpstation_prefs

  role   :osx_base
  role   :osx_prefs
  role   :osx_apps

  # role   :package_set

  facet :mrflip do
    # server(0).name   'worblehat'
    # role   :osx_heavy
  end

  facet :travis do
  end

end
