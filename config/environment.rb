RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|

  config.gem "haml"
  config.gem "httparty"
  config.gem "oauth"
  config.gem "oauth2"
  config.gem "configatron"

  config.time_zone = 'UTC'
  
end