class PostsController < ApplicationController
  
  def new
    
  end

  def create
    
    @post = params[:post]
    
    if @post["service"] == "facebook"
      
      response = Facebook.new(session[:user][:token]).class.post('/me/feed', :query => {
        :message => @post["text"], 
        :picture => "#{root_url}images/artwork.jpg",
        :link => root_url,
        :source => "http://p1.soundcloud.com/player.swf?url="+SETTINGS["track"]+SETTINGS["player"]["params"]+"&player_type="+SETTINGS["player"]["type"]+"&default_width=259&default_height=259&autoplay=true",
        :name => SETTINGS["title"],
        :caption => root_url,
        :description => SETTINGS["description"]
        }
      )
      
      puts response.inspect
      
    elsif @post["service"] == "twitter"
      
      oauth("twitter", session[:user][:token], session[:user][:secret]).post('/statuses/update.json', {:status => @post["text"]})
      
    end
    
    session[:download] = true
    
    redirect_to root_path
    
  end
  
  def download
    
    if session[:download]
      location = oauth("soundcloud", Settings.token, Settings.secret).get("#{SETTINGS["track"]}/download")["location"]
      if location
        puts "working"
        logger.info "working"
        redirect_to location
      else
        puts "fix"
        logger.info "fix"
        redirect_to "http://soundcloud.com/scars/fucking/download"
      end
    else
      redirect_to root_path
    end
    
  end

end