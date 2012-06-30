#
# Typically, you set these with environment variables:
#

organization            ENV['CSTN_ORG']           # the chef org for managing
cluster                 ENV['CSTN_CLUSTER']       # your cluster
facet                   ENV['CSTN_FACET']         # name of this box
facet_index             ENV['CSTN_INDEX'] || "0"  # leave at zero, probably

if [organization.to_s, cluster.to_s, facet.to_s, facet_index.to_s].any?(&:empty?)
  raise "Please set the CSTN_ORG, CSTN_CLUSTER, CSTN_FACET, and CSTN_INDEX options"
end

# # Use this if chef server is running from localhost
# chef_server_url         "http://localhost:4000"
# validation_client_name  "chef-validator"

# Use this if chef server is running from opscode platform
chef_server_url         "https://api.opscode.com/organizations/#{organization}"
validation_client_name  "#{organization}-validator"

#
# You shouldn't need to touch the below
#

chimpstation_dir        File.expand_path('..', File.dirname(__FILE__))
credentials_dir         File.join(chimpstation_dir, 'knife/credentials')
log_level               :info

node_name               "#{cluster}-#{facet}-#{facet_index}"

chef_server_url         "https://api.opscode.com/organizations/#{organization}"
validation_client_name  "#{organization}-validator"
client_key              "#{credentials_dir}/client_keys/client-#{node_name}.pem"

$stderr.puts %Q{
Running chimpstation:
* node_name:           #{node_name}
* chef_server:         #{chef_server_url}
* cluster/facet/index: #{cluster}-#{facet}-#{facet_index}
* chimpstation_dir:    #{chimpstation_dir}
* chef cache path:     #{file_cache_path}
* cookbooks path:      #{cookbook_path}
}
$stderr.puts
