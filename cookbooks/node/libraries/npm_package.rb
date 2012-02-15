require 'chef/resource/package'

class Chef::Resource::NpmPackage < ::Chef::Resource::Package
  def initialize(name, run_context = nil)
    super
    @resource_name = :npm_package
    @provider      = Chef::Provider::Package::Npm
  end
end
