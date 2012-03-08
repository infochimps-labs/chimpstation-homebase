
# https://central.github.com/mac/latest

default[:chimpstation_pkg][:github_for_mac][:release_url]  = "https://github-central.s3.amazonaws.com/mac%2FGitHub%20for%20Mac%20:version:.zip"
default[:chimpstation_pkg][:github_for_mac][:app_path]     = "/Applications/Github.app"
default[:chimpstation_pkg][:github_for_mac][:version]      = "1.2.1"


default[:chimpstation_pkg][:github_for_mac][:release_url]  = "https://github.com/downloads/laullon/gitx/GitX-L_v:version:.zip"
default[:chimpstation_pkg][:github_for_mac][:app_path]     = "/Applications/GitX.app"
default[:chimpstation_pkg][:github_for_mac][:version]      = "0.8.3"

node.default["gitx_download_location"]="
