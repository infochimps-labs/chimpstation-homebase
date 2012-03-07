require 'chef/resource'
require 'shellwords'

#
# From https://github.com/josh/osx-cookbooks.git
# By Joshua Peek <josh@joshpeek.com>
# MIT License
#
class Chef::Resource::Archive < Chef::Resource
  def initialize(name, run_context = nil)
    super

    case ::File.extname(name)
    when '.tar'
      @provider = Chef::Provider::Archive::Tar
    when '.gz'
      @provider = Chef::Provider::Archive::Gzip
    when '.zip'
      @provider = Chef::Provider::Archive::Zip
    when '.dmg'
      @provider = Chef::Provider::Archive::Dmg
    end

    @resource_name = :archive
    @action = "extract"
    @allowed_actions.push(:extract)
  end

  def user(arg = nil)
    set_or_return(:user, arg, :kind_of => [String])
  end

  def path(arg = nil)
    set_or_return(:path, arg, :kind_of => [String], :default => ::File.dirname(name))
  end
end


require 'chef/provider'

class Chef::Provider::Archive < Chef::Provider
  include Chef::Mixin::Command

  def load_current_resource
  end

  def action_extract
    run_command(:command => "mkdir -p #{@new_resource.path.shellescape}", :user => @new_resource.user)

    extract @new_resource

    @new_resource.updated_by_last_action true
    Chef::Log.info("Ran #{@new_resource} successfully")
  end

  def extract(resource)
    raise NotImplemented
  end
end

class Chef::Provider::Archive::Tar < Chef::Provider::Archive
  def extract(resource)
    command = "tar -xf #{resource.name.shellescape}"
    run_command(:command => command, :cwd => resource.path, :user => resource.user)
  end
end

class Chef::Provider::Archive::Gzip < Chef::Provider::Archive
  def extract(resource)
    command = "tar -zxf #{resource.name.shellescape}"
    run_command(:command => command, :cwd => resource.path, :user => resource.user)
  end
end

class Chef::Provider::Archive::Zip < Chef::Provider::Archive
  def extract(resource)
    command = "unzip -o #{resource.name.shellescape}"
    run_command(:command => command, :cwd => resource.path, :user => resource.user)
  end
end

class Chef::Provider::Archive::Dmg < Chef::Provider::Archive
  def extract(resource)
    status, stdout, stderr = output_of_command("hdiutil attach #{resource.name.shellescape}", {:user => resource.user})
    if status == 0
      volume = stdout.split("\t").last.chomp
      volume_files = ::File.join(volume.shellescape, "*")
      run_command(:command => "cp -R #{volume_files} #{resource.path.shellescape}", :user => resource.user)
      run_command(:command => "hdiutil detach #{volume.shellescape}", :user => resource.user)
    else
      raise "could not mount #{resource.name}"
    end
  end
end
