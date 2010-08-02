class ApplicationController < ActionController::Base
  
  helper :all
  protect_from_forgery
  
  protected
  
  # OAUTH
  
  def oauth_consumer(service)
    @oauth_consumer ||= OAuth::Consumer.new(config[service]['key'], config[service]['secret'], :site => config[service]['base_url'])
  end
  
  def oauth_token(service, token, secret)
    @oauth_token ||= OAuth::AccessToken.new(oauth_consumer(service), token, secret)
  end
  
  # OAUTH 2
  
  def oauth2_client
    @oauth2_client ||= OAuth2::Client.new(config['facebook']['app_id'], config['facebook']['secret'], :site => config['facebook']['base_url'])
  end
  
  def oauth2_token
    
  end
  
  # CONFIG
  
  def config
    config = YAML.load(File.open(RAILS_ROOT + '/config/auth.yml').read)[RAILS_ENV]
  end
  
end
