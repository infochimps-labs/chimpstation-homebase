directory "/usr/local/bin" do
  owner $ws_user
  recursive true
end

execute "your current user owns /usr/local" do
  command "chown -R #{$ws_user} /usr/local"
end
