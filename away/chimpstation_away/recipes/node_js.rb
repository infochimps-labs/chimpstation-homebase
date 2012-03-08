brew_install "node"

node_version = "1.1.0-2"

npm_git_location = "#{Chef::Config[:file_cache_path]}/npm"

directory npm_git_location do
  owner $ws_user
  action :create
  recursive true
end

git npm_git_location do
  repository "https://github.com/isaacs/npm.git"
  revision "v#{node_version}"
  action :sync
  user $ws_user
end

execute "compile rvm" do
  command "cd #{npm_git_location} &&  make install"
  user $ws_user
  not_if "npm -v | grep #{node_version}"
end
