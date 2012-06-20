#
# Activate 'locate' service (updatedb)
#
service 'com.apple.locate'

#
# SSH
#
execute "turn on ssh" do
  command "systemsetup -setremotelogin on"
  not_if  "systemsetup -getremotelogin | grep -q 'Remote Login: On'"
end
