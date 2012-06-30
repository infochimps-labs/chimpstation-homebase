
override[:users]['root'][:primary_user]  = $ws_user
override[:users]['root'][:primary_group] = 'staff'

override[:nfs][:conf_dir] = '/usr/local/etc'
override[:silverware] = { :user => ENV['USER'], :group => 'staff', :conf_dir => '/usr/local/etc/silverware', :log_dir => '/usr/local/var/log/silverware', :home_dir => '/usr/local/etc/silverware', }
