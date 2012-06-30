#
# Typically, you set these with environment variables:
#

organization            ENV['CSTN_ORG']           # the chef org for managing
cluster                 ENV['CSTN_CLUSTER']       # your cluster
facet                   ENV['CSTN_FACET']         # name of this box
facet_index             ENV['CSTN_INDEX'] || "0"  # leave at zero, probably

if [organization.to_s, cluster.to_s, facet.to_s, facet_index.to_s].any?(&:empty?)
  raise "Please set the CSTN_ORG, CSTN_CLUSTER, CSTN_FACET, and CSTN_INDEX environment variables"
end

if organization == 'local'
  # Use this if chef server is running from localhost
  chef_server_url         "http://localhost:4000"
  validation_client_name  "chef-validator"
else
  # Use this if chef server is running from opscode platform
  chef_server_url         "https://api.opscode.com/organizations/#{organization}"
  validation_client_name  "#{organization}-validator"
end

#
# You shouldn't need to touch the below
#

chimpstation_dir        File.expand_path('..', File.dirname(__FILE__))
credentials_dir         File.join(chimpstation_dir, "knife/#{organization}-credentials")
log_level               :info

node_name               "#{cluster}-#{facet}-#{facet_index}"
client_key              "#{credentials_dir}/client_keys/client-#{node_name}.pem"

base_dir = "/usr/local/var/chef/#{ENV['USER']}"
unless File.exist?(base_dir) then require 'fileutils' ; FileUtils.mkpath(base_dir) ; end
log_level               :info
cookbook_path         [ File.join(base_dir, "cookbooks") ]
checksum_path           File.join(base_dir, "checksum")
log_location            File.join(base_dir, "client.log")
file_backup_path        File.join(base_dir, "backup")
file_cache_path         File.join(base_dir, "cache")
pid_file                File.join(base_dir, "client.pid")
cache_options({:path => File.join(base_dir, "cache", "checksums"), :skip_expires => true})

$stderr.puts %Q{
Running chimpstation:
* node_name:           #{node_name}
* chef_server:         #{chef_server_url}
* cluster/facet/index: #{cluster}-#{facet}-#{facet_index}
* chimpstation_dir:    #{chimpstation_dir}
* client key:          #{client_key}
* base dir:            #{base_dir}
* cookbooks path:      #{cookbook_path}
}
$stderr.puts
