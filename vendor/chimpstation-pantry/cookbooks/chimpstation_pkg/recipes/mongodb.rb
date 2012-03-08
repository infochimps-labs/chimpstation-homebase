include_recipe "chimpstation_base::homebrew"

unless brew_installed? "mongodb"
  brew_install "mongodb"

  directory "/Users/#{$ws_user}/Library/LaunchAgents" do
    owner $ws_user
    action :create
  end

  execute "copy mongodb plist to ~/Library/LaunchAgents" do
    command "cp `brew --prefix mongodb`/org.mongodb.mongod.plist #{$ws_home}/Library/LaunchAgents/"
    user $ws_user
  end

  execute "load the mongodb plist into the mac daemon startup thing" do
    command "launchctl load -w #{$ws_home}/Library/LaunchAgents/org.mongodb.mongod.plist"
    user $ws_user
  end
end
