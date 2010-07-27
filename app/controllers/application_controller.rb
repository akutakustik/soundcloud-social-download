class ApplicationController < ActionController::Base
  
  helper :all
  protect_from_forgery
  
  protected
  
  def consumer(service)
    @consumer ||= OAuth::Consumer.new(config[service]['key'], config[service]['secret'], :site => config[service]['base_url'])
  end
  
  def client
    @client ||= OAuth2::Client.new(config['facebook']['app_id'], config['facebook']['secret'], :site => config['facebook']['base_url'])
  end
  
  def oauth(service, token, secret)
    @oauth ||= OAuth::AccessToken.new(consumer(service), token, secret)
  end
  
  def config
    config = YAML.load(File.open(RAILS_ROOT + '/config/auth.yml').read)[RAILS_ENV]
  end
  
end
