#
# Flip's boxen
#
Ironfan.cluster 'fleep' do

  role   :chimpstation_base
  role   :chimpstation_prefs
  role   :homebrew

  role   :osx_base
  role   :osx_chef_dev
  role   :user_flip, :last

  role   :homebrew

  # role   :osx_consistent_ux

  role   :osx_chef_dev
  # role   :osx_data_miner
  # role   :osx_web_dev

  # role   :ironfan_ci_master

  role    :nfs_server

  facet :worblehat do
  end

  cluster_role.override_attributes({
      # set this to YOUR username on the local machine
      :chef_server => { :user => 'flip', },
      :nfs  => {
        :announce_as => 'control',
        :exports => {
          '/Users/flip' => { :name => 'flip',  :nfs_options => '-network 33.33.33 -mapall=0:80 -mask 255.255.255.0' },
        },
      },
      :osx_prefs => {
        :locate => { :prunepaths => %w[ /foo /data/ripd /lion-away  /Users/flip/Library/Mail ] },
      },

      # :announces   => {
      #   "control-nfs-server"      => { name: "nfs_server", addr: "33.33.33.1", sys: "nfs", subsys:"server",      realm: "control", timestamp:"20120605202808Z", },
      #   "control-nfs-/Users/flip" => { name: "flip",       addr: "33.33.33.1", sys: "nfs", subsys:"/Users/flip", realm: "control", timestamp:"20120605202808Z", },
      # }
    })

  # chef_node = Chef::Node.load('fleep-worblehat-0') rescue nil
  # p chef_node
  # if (Chef::Config.organization == 'local') && (chef_node)
  #   ui.info ui.color("\n  Setting workstation #{chef_node} as the NFS provider\n", :blue)
  #   chef_node.normal[:announces] = { "control-nfs-server" => { sys: "nfs", subsys:"server", name: "nfs_server", realm: "control", timestamp:"20120605202808Z", },}
  #   # chef_node.normal[:cloud    ] = { "control-nfs-server" => { sys: "nfs", subsys:"server", name: "nfs_server", realm: "control", timestamp:"20120605202808Z", },}
  #   chef_node.save
  # end
end
