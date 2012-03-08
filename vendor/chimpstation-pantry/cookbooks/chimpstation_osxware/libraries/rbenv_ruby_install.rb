class Chef::Recipe
  def rbenv_ruby_install(ruby_version, env_override)
    include_recipe "chimpstation_base::rbenv"

    #don't use the marker file system for this.  we guess that people are likely to be installing rubies by hand using rbenv.
      #...that guess might be wrong.
    unless File.exists?("#{::RBENV_HOME}/#{ruby_version}/bin/ruby")

      install_cmd = "#{env_override} #{RBENV_COMMAND} install #{ruby_version}"

      execute "installing #{ruby_version} with RBENV: #{install_cmd}" do
        command install_cmd
        user $ws_user
      end

      execute "check #{ruby_version}" do
        command "#{RBENV_COMMAND} versions | grep #{ruby_version}"
        user $ws_user
      end

    end
  end
end
