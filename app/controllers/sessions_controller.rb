class SessionsController < ApplicationController
  
  def new
    
    if params[:service] == "facebook"
    
      redirect_to client.web_server.authorize_url(:redirect_uri => oauth_callback_url, :scope => 'publish_stream')
      
    elsif params[:service] == "twitter"
      
      request_token = consumer.get_request_token({:oauth_callback => oauth_callback_url})
      
      session[:request_token] = request_token.token
      session[:request_token_secret] = request_token.secret
      
      redirect_to request_token.authorize_url
      
    end
    
  end

  def oauth_callback
    
    request_token = OAuth::RequestToken.new(consumer, session[:request_token], session[:request_token_secret])
    
    access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    
    session[:request_token] = nil
    session[:request_token_secret] = nil
    
    #render :text => access_token.token
    
    session[:twitter] = {:token => access_token.token, :secret => access_token.secret}
    
    #session[:twitter] = access_token.token
    #session[:twitter][:secret] = access_token.secret
    
    #flash[:notice] = 'You have logged into Twitter.'
    #redirect_to root_path
    
=begin    
    
    access_token = client.web_server.get_access_token(
      params[:code], :redirect_uri => oauth_callback_url
    )
    
    session[:facebook] = access_token.token
    
    flash[:notice] = 'You have logged into Facebook.'
    redirect_to root_path
    
=end    
    
  end

  def destroy
    session[:facebook] = nil
    session[:twitter] = nil
    redirect_to root_path
  end
  
  protected
  
  def client
    
    # config = YAML.load(File.open(RAILS_ROOT + '/config/facebook_auth.yml').read)[RAILS_ENV]
    
    @client ||= OAuth2::Client.new(
      # config['app_id'], config['secret'], :site => 'https://graph.facebook.com'
      "130178800328203", "82933a3c53aaf5cb027ec0ee6ced6c87", :site => 'https://graph.facebook.com'
    )
    
  end
  
  def consumer
    
    @consumer ||= OAuth::Consumer.new(
      "D9tonxAqgH73v3h3bIPNTA", "hfcEuzoHRSKDVzaPkxQZHrX3bDjOHnNtaGIEnMw", {
        :site => 'https://twitter.com',
        :authorize_path => '/oauth/authenticate',
        :request_token_path => '/oauth/request_token',
        :access_token_path => '/oauth/access_token'
      }
    )
    
  end

end