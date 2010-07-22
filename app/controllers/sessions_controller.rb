class SessionsController < ApplicationController
  
  def new
    
    if params[:service] == "facebook"
    
      redirect_to client.web_server.authorize_url(:redirect_uri => facebook_callback_url, :scope => 'publish_stream')
    
    else  
    
      if params[:service] == "twitter"
        request_token = consumer.get_request_token({:oauth_callback => twitter_callback_url})
      else
        # soundcloud consumer...
      end
      
      session[:request_token], session[:request_token_secret] = request_token.token, request_token.secret
      
      redirect_to request_token.authorize_url
      
    end
    
  end

  def oauth_callback
    
    if params[:service] == "facebook"
      
      access_token = client.web_server.get_access_token(params[:code], :redirect_uri => facebook_callback_url)

      session[:facebook] = access_token.token
      
    else
      
      if params[:service] == "twitter"
        request_token = OAuth::RequestToken.new(consumer, session[:request_token], session[:request_token_secret])
      else
        # soundcloud consumer...
      end
      
      access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    
      session[:request_token], session[:request_token_secret] = nil
    
      session[:twitter] = {:token => access_token.token, :secret => access_token.secret}
      
    end
    
    redirect_to root_path
    
  end

  def destroy
    session[:facebook], session[:twitter] = nil
    redirect_to root_path
  end

end