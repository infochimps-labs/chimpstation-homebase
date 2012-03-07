log_level               :info
log_location            "/var/log/chef/client.log"

organization            "chimpstation"
cluster                 "workstation"
facet                   "mrflip"
facet_index             "0"

node_name               "workstation-mrflip-0"

chef_server_url         "https://api.opscode.com/organizations/#{organization}"
validation_client_name  "#{organization}-validator"
client_key              "/etc/chef/client-workstation-mrflip-0.pem"

file_backup_path        "/var/chef/backup"
file_cache_path         "/var/chef/cache"
pid_file                "/var/run/client.pid"
