defaults "com.apple.safari", "AutoFillPasswords" do
  value node[:apple][:safari][:auto_fill_passwords]
end

defaults "com.apple.safari", "IncludeDevelopMenu" do
  value node[:apple][:safari][:develop_menu]
end

defaults "com.apple.safari", "DownloadsClearingPolicy" do
  value node[:apple][:safari][:downloads_clearing_policy]
end

defaults "com.apple.safari", "ShowFavoritesBar" do
  value node[:apple][:safari][:show_favorites_bar]
end
