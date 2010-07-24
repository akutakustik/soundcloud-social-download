class PostsController < ApplicationController
  
  def new  
    
  end

  def create
    
    @post = params[:post]
    
    if @post["service"] == "facebook"
      
=begin      
      
      response = Facebook.new(session[:facebook]).class.post('/me/feed', 
        :query => {
          :message => "testing social download",
          #:picture => @product.image("compact"),
          :link => root_url,
          :name => "social download"
          #:caption
          #:description
        }
      )
      
=end 
      
    elsif @post["service"] == "twitter"
      
      access_token("twitter").post('/statuses/update.json', {:status => @post["text"]})
      
    end
    
    flash[:notice] = "thanks for posting to #{@post["service"]}"
    
    redirect_to root_path
    
  end

end
