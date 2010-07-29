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
      location = oauth("soundcloud", Settings.token, Settings.secret).get("#{SETTINGS["track"]}/download")["location"]
      if location
        puts "working"
        redirect_to location
      else
        puts "fix"
        redirect_to "http://soundcloud.com/scars/fucking/download"
      end
    else
      redirect_to root_path
    end
    
  end

end