require 'chef/provider/package'

require 'open-uri'
require 'json'

class Chef::Provider::Package::Npm < ::Chef::Provider::Package
  def initialize(new_resource, run_context)
    super

    @user = run_context.node[:npm][:user]
  end

  def load_current_resource
    @current_resource = Chef::Resource::NpmPackage.new(@new_resource.name)
    @current_resource.package_name(@new_resource.name)

    @current_resource.version(current_installed_version)
    Chef::Log.debug("Current version is #{@current_resource.version}") if @current_resource.version

    @candidate_version = npm_candiate_version

    if !@new_resource.version && !@candidate_version
      raise Chef::Exceptions::Package, "Could not get a candidate version for this package -- #{@new_resource.name} does not seem to be a valid package!"
    end

    Chef::Log.debug("npm candidate version is #{@candidate_version}")

    @current_resource
  end

  def current_installed_version
    name = @new_resource.package_name
    if package = global_installed_packages.detect { |n| n =~ /^#{name}@/ }
      package.split("@")[1]
    end
  end

  def npm_candiate_version
    name = @new_resource.package_name
    json = open("http://registry.npmjs.org/#{name}/latest").read
    if package = JSON.parse(json)
      package['version']
    end
  end

  def install_package(name, version)
    command = "npm install --global#{expand_options(@new_resource.options)} #{name}"
    command << "@#{version}" if version && !version.empty?
    run_npm_command command
  end

  def upgrade_package(name, version)
    install_package(name, version)
  end

  def remove_package(name, version)
    purge_package(name, version)
  end

  def purge_package(name, version)
    command = "npm uninstall --global #{name}"
    command << "@#{version}" if version && !version.empty?
    run_npm_command command
  end

  def run_npm_command(command)
    run_command(:command => command, :user => @user)
  end

  def global_installed_packages
    root = npm_root
    status, stdout, stderr = output_of_command("npm list --global --long --parseable", {:user => @user})

    if status == 0
      pkgs = stdout.split("\n").map { |line| line.split(":") }
      pkgs = pkgs.select { |pkg| ::File.dirname(pkg[0]) == root }
      pkgs.map { |pkg| pkg[1] }.compact.uniq
    else
      []
    end
  end

  def npm_root
    status, stdout, stderr = output_of_command("npm root --global", {:user => @user})

    if status == 0
      stdout
    else
      raise "no npm root"
    end
  end
end
