ruby_locations = [
      '~/.rvm/rubies/*/lib/ruby/**/rubygems/deprecate.rb',
  '~/.rbenv/versions/*/lib/ruby/**/rubygems/deprecate.rb',
].each do |path|
  Dir[path].each do |file|
    Chef::Util::FileEdit.new(file).search_file_replace(/@skip \|\|= false/, '@skip ||= true')
  end
end
