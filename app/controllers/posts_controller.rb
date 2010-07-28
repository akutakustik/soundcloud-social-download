class PostsController < ApplicationController
  
  def new 

  end

  def create
    
    @post = params[:post]
    
    if @post["service"] == "facebook"
      
      Facebook.new(session[:user][:token]).class.post('/me/feed', :query => {:message => @post["text"], :link => root_url})
      
    elsif @post["service"] == "twitter"
      
      oauth("twitter", session[:user][:token], session[:user][:secret]).post('/statuses/update.json', {:status => @post["text"]})
      
    end
    
    session[:download] = true
    
    redirect_to root_path
    
  end
  
  def download
    
    if session[:download]
      puts oauth("soundcloud", Settings.token, Settings.secret).get("http://soundcloud.com/leemartin/private-test/download")
      #puts location = oauth("soundcloud", Settings.token, Settings.secret).get("#{SETTINGS["track"]}/download") #["location"]
      #location = oauth("soundcloud", Settings.token, Settings.secret).get("http://sandbox-soundcloud.com/leemartin/private-test/download")
      #redirect_to location
    else
      redirect_to root_path
    end
    
  end

end