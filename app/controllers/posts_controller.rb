class PostsController < ApplicationController
  
  def new 
    
    #puts Settings.config["title"]
    
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
      
      access_token("twitter").post('/statuses/update.json', {:status => @post["text"]})
      
    end
    
    flash[:notice] = "thanks for posting to #{@post["service"]}"
    
    redirect_to root_path
    
  end

end
