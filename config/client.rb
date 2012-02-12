base_dir = "/usr/local/var/chef/#{ENV['USER']}"
organization        File.expand_path(ENV['CHEF_ORGANIZATION'])
homebase            File.expand_path(ENV['CHEF_HOMEBASE'])

node_name               "worblehat-laptop-0"

log_level               :info
log_location            "#{base_dir}/client.log"

chef_server_url         "http://localhost:4000"
validation_client_name  "chef-validator"

checksum_path           "#{base_dir}/checksum"
file_cache_path         "#{base_dir}/cache"
file_backup_path        "#{base_dir}/backup"

pid_file                "#{base_dir}/client.pid"

cache_options({:path => "#{base_dir}/cache/checksums", :skip_expires => true})
