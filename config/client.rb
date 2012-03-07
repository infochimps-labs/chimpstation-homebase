require 'fileutils'

organization            "chimpstation"
cluster                 "workstation"
facet                   "mrflip"
facet_index             "0"

node_name               "#{cluster}-#{facet}-#{facet_index}"

chef_server_url         "https://api.opscode.com/organizations/#{organization}"
validation_client_name  "#{organization}-validator"
# chef_server_url         "http://localhost:4000"
# validation_client_name  "chef-validator"

client_key              "/etc/chef/client-#{node_name}.pem"

base_dir = "/usr/local/var/chef/#{ENV['USER']}"
FileUtiles.mkdir_p(base_dir)
log_level               :info
checksum_path           File.join(base_dir, "checksum")
log_location            File.join(base_dir, "client.log")
file_backup_path        File.join(base_dir, "backup")
file_cache_path         File.join(base_dir, "cache")
pid_file                File.join(base_dir, "client.pid")
cache_options({:path => "#{base_dir}/cache/checksums", :skip_expires => true})
