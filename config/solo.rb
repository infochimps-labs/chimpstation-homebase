
homebase                File.expand_path("..", File.realdirpath(File.dirname(__FILE__)))
cookbook_path           [ File.expand_path('cookbooks', homebase) ]
role_path               [ File.expand_path('roles',     homebase) ]

base_dir = "/usr/local/var/chef/#{ENV['USER']}"

require 'fileutils'
FileUtils.mkdir_p(base_dir)
log_level               :info
checksum_path           File.join(base_dir, "checksum")
log_location            File.join(base_dir, "client.log")
file_backup_path        File.join(base_dir, "backup")
file_cache_path         File.join(base_dir, "cache")
pid_file                File.join(base_dir, "client.pid")
cache_options({:path => File.join(base_dir, "cache", "checksums"), :skip_expires => true})
