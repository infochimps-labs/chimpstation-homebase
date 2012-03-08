class Chef::Recipe
  def brew_install(package, opts={})
    include_recipe "chimpstation_base::homebrew"

    execute "brew install #{package} #{opts[:brew_args]}" do
      user $ws_user
      command "brew install #{package} #{opts[:brew_args]}"
      not_if "brew list | grep '^#{package}$'"
    end
  end

  def brew_installed?(package)
    include_recipe "chimpstation_base::homebrew"

    system("brew list #{package}")
  end

  def brew_remove(package)
    include_recipe "chimpstation_base::homebrew"

    brew_installed = `brew list | grep #{package}`
    unless brew_installed.empty?
      execute "brew remove #{package}" do
        user $ws_user
        command "brew remove #{package}"
      end
    end
  end

  def brew_update
    include_recipe "chimpstation_base::homebrew"

    execute "brew update" do
      user $ws_user
      command "brew update"
    end
  end
end
