include_recipe "homebrew"

package        'mysql'

#
# http://solutions.treypiepmeier.com/2010/02/28/installing-mysql-on-snow-leopard-using-homebrew/
#

# run_unless_marker_file_exists("mysql_" + marker_version_string_for("homebrew")) do
#   execute "mysql_install_db" do
#     command    "mysql_install_db --verbose --user=#{$ws_user} --basedir=\"$(brew --prefix mysql)\" --datadir=/usr/local/var/mysql --tmpdir=/tmp"
#     user       $ws_user
#   end
# end
#
# ruby_block "Checking that mysql is running" do
#   block do
#     Timeout::timeout(60) do
#       until system("ls /tmp/mysql.sock")
#         sleep 1
#       end
#     end
#   end
# end
#
# execute "set the root password to the default" do
#   command "mysqladmin -uroot password #{DEFAULT_MYSQL_PASSWORD}"
#   not_if "mysql -uroot -p#{DEFAULT_MYSQL_PASSWORD} -e 'show databases'"
# end
#
# execute "insert time zone info" do
#   command "mysql_tzinfo_to_sql /usr/share/zoneinfo | mysql -uroot -p#{DEFAULT_MYSQL_PASSWORD} mysql"
#   not_if "mysql -uroot -p#{DEFAULT_MYSQL_PASSWORD} mysql -e 'select * from time_zone_name' | grep -q UTC"
# end
