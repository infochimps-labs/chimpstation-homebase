source "http://rubygems.org"

#
# Chef
#

gem 'chef',            "= 10.12.0"
gem 'ironfan',         "~> 3.1.6"
gem 'vagrant',         "~> 1.0"
gem 'veewee',          ">= 0.2"
gem 'fog',             "~> 1.2"

#
# Test drivers
#

group :test do
  gem 'rake'
  gem 'bundler',       ">= 1.1"
  gem 'rspec',         "~> 2.5"
  gem 'redcarpet',     "~> 2"
  gem 'cucumber',      "~> 1.1"
end

#
# Development
#

group :development do
  gem 'yard',          "~> 0.6"
  gem 'jeweler'

  # gem 'ruby_gntp'
  if RUBY_PLATFORM.include?('darwin')
    # gem 'growl',      "~> 1"
    gem 'rb-fsevent', "~> 0.9"
  end

  gem 'guard',         "~> 1"
  gem 'guard-chef',    :git => 'git@github.com:infochimps-forks/guard-chef.git'
  # gem 'guard-chef',    :path => '../guard-chef'

  # gem 'guard-process', "~> 1"
  # gem 'guard-cucumber'
end

group :support do
  gem 'pry'  # useful in debugging
  gem 'grit' # used in rake scripts for push/pulling cookbooks
end
