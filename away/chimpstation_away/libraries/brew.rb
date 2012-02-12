class Chef::Recipe
  def brew_install(package, opts={})
    include_recipe "chimpstation-base::homebrew"

    execute "brew install #{package} #{opts[:brew_args]}" do
      user WS_USER
      command "brew install #{package} #{opts[:brew_args]}"
      not_if "brew list | grep '^#{package}$'"
    end
  end

  def brew_installed?(package)
    include_recipe "chimpstation-base::homebrew"

    system("brew list #{package}")
  end

  def brew_remove(package)
    include_recipe "chimpstation-base::homebrew"

    brew_installed = `brew list | grep #{package}`
    unless brew_installed.empty?
      execute "brew remove #{package}" do
        user WS_USER
        command "brew remove #{package}"
      end
    end
  end

  def brew_update
    include_recipe "chimpstation-base::homebrew"

    execute "brew update" do
      user WS_USER
      command "brew update"
    end
  end
end
