class SessionsController < ApplicationController
  
  def new
    redirect_to client.web_server.authorize_url(
      :redirect_uri => oauth_callback_url,
      :scope => 'publish_stream'
    )
  end

  def oauth_callback
    
    access_token = client.web_server.get_access_token(
      params[:code], :redirect_uri => oauth_callback_url
    )
    
    session[:facebook] = access_token.token
    
    flash[:notice] = 'You have logged into Facebook.'
    redirect_to root_path
    
  end

  def destroy
    # session[:user_id] = nil
  end
  
  protected
  
  def client
    
    # config = YAML.load(File.open(RAILS_ROOT + '/config/facebook_auth.yml').read)[RAILS_ENV]
    
    @client ||= OAuth2::Client.new(
      # config['app_id'], config['secret'], :site => 'https://graph.facebook.com'
      "130178800328203", "82933a3c53aaf5cb027ec0ee6ced6c87", :site => 'https://graph.facebook.com'
    )
    
  end

end