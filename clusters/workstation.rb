#
# Sandbox cluster -- use this for general development
#
Ironfan.cluster 'workstation' do

  environment           :ws

  role   :

  facet :mrflip do
    # server(0).name   'worblehat'
  end

end
