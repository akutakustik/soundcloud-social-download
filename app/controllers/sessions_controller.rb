class SessionsController < ApplicationController
  
  def new
    
    reset_session
    
    if params[:service] == "facebook"
    
      redirect_to client.web_server.authorize_url(:redirect_uri => oauth_callback_url("facebook"), :scope => 'publish_stream')
    
    else  
      
      request_token = consumer(params[:service]).get_request_token({:oauth_callback => oauth_callback_url(params[:service])})
      
      session[:request_token], session[:request_token_secret] = request_token.token, request_token.secret
      
      redirect_to request_token.authorize_url
      
    end 
    
  end

  def oauth_callback
    
    if params[:service] == "facebook" # oauth2
      
      access_token = client.web_server.get_access_token(params[:code], :redirect_uri => oauth_callback_url("facebook"))
      
      result = Facebook.new(access_token.token).class.get('/me')
      
      session[:user] = {:service => "facebook", :token => access_token.token, :name => result["name"], :picture => "https://graph.facebook.com/#{result["id"]}/picture"}
      
    else # oauth
      
      request_token = OAuth::RequestToken.new(consumer(params[:service]), session[:request_token], session[:request_token_secret])
      
      access_token = request_token.get_access_token(:oauth_verifier => params[:oauth_verifier])
    
      session[:request_token], session[:request_token_secret] = nil
      
      if params[:service] == "twitter"
        
        result = Crack::JSON.parse(access_token.get('/account/verify_credentials.json').body)
        
        session[:user] = {:service => "twitter", :token => access_token.token, :secret => access_token.secret, :name => result["name"], :picture => result["profile_image_url"]}
        
      elsif params[:service] == "soundcloud"
        
        #track_url = access_token.get("/resolve?url=#{Settings.config["track"]}")["location"]
        
        #if track_url
        
          #track_user_id = Crack::JSON.parse(access_token.get("#{track_url}.json").body)["user"]["id"]
        
          #user_id = Crack::JSON.parse(access_token.get('/me.json').body)["id"]
        
          #if user_id == track_user_id
          
            flash[:notice] = "You have successfully connected with SoundCloud"
          
            Settings.token, Settings.secret = access_token.token, access_token.secret
          
          #else
          
            #flash[:notice] = "Error"
          
          #end
          
        #else
          
          #flash[:notice] = "Error"
          
        #end
        
      end
      
    end
    
    redirect_to root_path
    
  end

  def destroy
    reset_session
    redirect_to root_path
  end

end