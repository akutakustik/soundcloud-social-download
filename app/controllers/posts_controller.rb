class PostsController < ApplicationController
  
  def new 
    
  end

  def create
    
    @post = params[:post]
    
    if @post["service"] == "facebook"
      
      response = Facebook.new(session[:user][:token]).class.post('/me/feed', 
        :query => {
          :message => @post["text"],
          :picture => "#{root_url}images/artwork.jpg",
          :link => root_url,
          :name => "social download" # title of page
          #:caption => "social-download.com", # caption of title
          #:description => "social post for a free download" # description below caption
        }
      )
      
    elsif @post["service"] == "twitter"
      
      oauth("twitter", session[:user][:token], session[:user][:secret]).post('/statuses/update.json', {:status => @post["text"]})
      
    end
    
    session[:download] = true
    
    redirect_to root_path
    
  end
  
  def download
    
    if session[:download]
      logger.info "#{Settings.token} #{Settings.secret} #{Settings.config["track"]}"
      location = oauth("soundcloud", Settings.token, Settings.secret).get("#{Settings.config["track"]}/download") #["location"]
      logger.info location
    else
      redirect_to root_path
    end
    
  end

end
