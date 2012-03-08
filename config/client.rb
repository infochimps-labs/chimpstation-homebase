#
# Please edit the following
#

organization            YOUR_ORGANIZATION_HERE
cluster                 "workstation"
facet                   YOUR_NAME_HERE
facet_index             FACET_INDEX_HERE

#
# You shouldn't need to touch the below
#

node_name               "#{cluster}-#{facet}-#{facet_index}"

chef_server_url         "https://api.opscode.com/organizations/#{organization}"
validation_client_name  "#{organization}-validator"

client_key              "/etc/chef/client-#{node_name}.pem"

base_dir = "/usr/local/var/chef/#{ENV['USER']}"
log_level               :info
checksum_path           File.join(base_dir, "checksum")
log_location            File.join(base_dir, "client.log")
file_backup_path        File.join(base_dir, "backup")
file_cache_path         File.join(base_dir, "cache")
pid_file                File.join(base_dir, "client.pid")
cache_options({:path => File.join(base_dir, "cache", "checksums"), :skip_expires => true})
