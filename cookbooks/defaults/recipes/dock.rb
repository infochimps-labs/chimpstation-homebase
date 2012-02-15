dock = service "com.apple.Dock.agent"

defaults "com.apple.dock", "no-glass" do
  value node[:apple][:dock][:no_glass]
  notifies :restart, dock, :delayed
end

defaults "com.apple.dock", "orientation" do
  value node[:apple][:dock][:orientation]
  notifies :restart, dock, :delayed
end

defaults "com.apple.dock", "autohide" do
  value node[:apple][:dock][:autohide]
  notifies :restart, dock, :delayed
end
