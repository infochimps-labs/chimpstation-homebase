include_recipe "homebrew"

package "pow"

execute "pow --install-local" do
  user node[:homebrew][:user]
  not_if "pow --install-local --dry-run"
end

execute "sudo pow --install-system" do
  user node[:homebrew][:user]
  not_if "pow --install-system --dry-run"
end
