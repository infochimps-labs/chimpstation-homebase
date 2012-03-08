class Chef::Recipe
  def bash_profile_include(bash_file, cookbook="chimpstation_base")
    include_recipe "chimpstation_base::bash_profile"

    template "#{BASH_INCLUDES_SUBDIR}/#{bash_file}.sh" do
      source "bash_profile-#{bash_file}.sh.erb"
      owner $ws_user
      backup false
      mode "0755"
    end
  end
end
