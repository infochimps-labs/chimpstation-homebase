# directory "/Users/#{$ws_user}/Library/LaunchAgents" do
#   owner         $ws_user
#   action        :create
# end
#

# --------------------
# Mongodb
#

# execute "copy mongodb plist to ~/Library/LaunchAgents" do
#   command       "cp `brew --prefix mongodb`/org.mongodb.mongod.plist #{$ws_home}/Library/LaunchAgents/"
#   user          $ws_user
# end
#
# execute "load the mongodb plist into the mac daemon startup thing" do
#   command       "launchctl load -w #{$ws_home}/Library/LaunchAgents/org.mongodb.mongod.plist"
#   user          $ws_user
# end

# --------------------
# MySQL
#

# run_unless_marker_file_exists("mysql_" + marker_version_string_for("homebrew")) do
#   execute "copy mysql plist to ~/Library/LaunchAgents" do
#     command    "cp `brew --prefix mysql`/com.mysql.mysqld.plist #{$ws_home}/Library/LaunchAgents/"
#     user       $ws_user
#   end
# end
#
# execute "load the mysql plist into the mac daemon startup thing" do
#   command "launchctl load -w #{$ws_home}/Library/LaunchAgents/com.mysql.mysqld.plist"
#   user $ws_user
#   not_if "launchctl list com.mysql.mysqld"
# end
