file "#{$ws_home}/.gemrc" do
  owner         $ws_user
  group         'admin'
  mode          '0644'
  action        :create
  content       "install: --no-rdoc --no-ri\nupdate: --no-rdoc --no-ri\n"
end
