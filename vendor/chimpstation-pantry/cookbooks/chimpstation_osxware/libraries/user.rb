$ws_user    = ENV['USER'].strip
$ws_home    = ENV['HOME']
$ws_library = "#{$ws_home}/Library"

raise "should not be root" if $ws_user=="root"
