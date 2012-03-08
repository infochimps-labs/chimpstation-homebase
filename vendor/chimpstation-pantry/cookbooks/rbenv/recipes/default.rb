include_recipe "homebrew"

package "rbenv"
package "ruby-build"

node[:rbenv][:versions].each do |version|
  execute "rbenv install #{version}" do
    user        node[:rbenv][:user]
    not_if{     File.exist?("#{node[:rbenv][:conf_dir]}/versions/#{version}")  }
  end
end

if version = node[:rbenv][:global]
  execute "rbenv global #{version}" do
    user        node[:rbenv][:user]
    not_if{     File.exist?("#{node[:rbenv][:conf_dir]}/global") }
  end
end
