class ApplicationController < ActionController::Base
  
  helper :all
  protect_from_forgery
  
  protected
  
  def consumer(service)
    if service == "twitter"
      @consumer ||= OAuth::Consumer.new(config['twitter']['key'], config['twitter']['secret'], :site => 'https://twitter.com')
    elsif service == "soundcloud"
      @consumer ||= OAuth::Consumer.new(config['soundcloud']['key'], config['soundcloud']['secret'], :site => 'http://api.soundcloud.com')
    end
  end
  
  def client
    @client ||= OAuth2::Client.new(config['facebook']['app_id'], config['facebook']['secret'], :site => 'https://graph.facebook.com')
  end
  
  def config
    config = YAML.load(File.open(RAILS_ROOT + '/config/auth.yml').read) #[RAILS_ENV]
  end
  
end
