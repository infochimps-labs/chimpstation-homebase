
#
# Screensaver
#

# Require password immediately after sleep or screen saver begins

domain = "com.apple.screensaver"
osx_defaults(domain, 'askForPassword'     ){ value  1 }
osx_defaults(domain, 'askForPasswordDelay'){ value  node[:osx_prefs][:screensaver][:lock_delay].to_f }
plist_dir = ENV['HOME'] + "/Library/Preferences/ByHost"
Dir["#{plist_dir}/com.apple.screensaver.*.plist"].each do |domain|
  osx_defaults(domain.gsub(/\.plist$/,''), 'idleTime'){ value  600 }
end

#
# Energy-saving values
#

# pmset_vals = Mash.new
# pmset_lines = `pmset -g`.chomp.split("\n").select{|line| line =~ /^\s+/ }
# pmset_lines.each{|line| key, val = line.strip.split(/\s+/, 2) ; pmset_vals[key] = val }
#
# p pmset_vals
#
# execute "set display, disk and computer sleep times" do
#   command "pmset -a displaysleep 20 disksleep 15 sleep 0"
# end
