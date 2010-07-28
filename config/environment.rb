RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  #config.gem "oauth-active-resource"
  #config.gem "soundcloud-ruby-api-wrapper"
  config.gem "haml"
  config.gem "httparty"
  config.gem "oauth"
  config.gem "oauth2"
  config.gem "rails-settings", :lib => "settings"

  config.time_zone = 'UTC'
  
end

require 'rubygems'
gem 'soundcloud-ruby-api-wrapper'
require 'soundcloud'