class PostsController < ApplicationController
  
  def new
    
  end

  def create
    
    @post = params[:post]
    
    if @post["service"] == "facebook"
      
      oauth2_token(session[:user][:token]).post('/me/feed', {
        :message => @post["text"], 
        :picture => "#{root_url}images/artwork.jpg",
        :link => root_url,
        :source => "http://p1.soundcloud.com/player.swf?url="+SETTINGS["track"]+SETTINGS["player"]["params"]+"&player_type="+SETTINGS["player"]["type"]+"&default_width=259&default_height=259&auto_play=true",
        :name => SETTINGS["title"],
        :caption => root_url,
        :description => SETTINGS["description"]
      })  
      
    elsif @post["service"] == "twitter"
      
      oauth_token("twitter", session[:user][:token], session[:user][:secret]).post('/statuses/update.json', {:status => @post["text"]})
      
    end
    
    session[:download] = true
    
    redirect_to root_path
    
  end
  
  def download
    
    if session[:download]
      redirect_to oauth_token("soundcloud", Settings.token, Settings.secret).get("#{SETTINGS["track"]}/download")["location"]
    else
      redirect_to root_path
    end
    
  end

end