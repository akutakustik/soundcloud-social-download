class PostsController < ApplicationController
  
  def index
    
  end
  
  def new
    
    @user = {}
    
    if logged_in("facebook")
      
      result = Facebook.new(session[:facebook]).class.get('/me')
      
      @user["name"], @user["picture"] = result["name"], "https://graph.facebook.com/#{result["id"]}/picture"
      
      @service = "facebook"
      
    elsif logged_in("twitter")
      
      @access_token = OAuth::AccessToken.new(consumer("twitter"), session[:twitter][:token], session[:twitter][:secret])
      
      result = Crack::JSON.parse(@access_token.get('/account/verify_credentials.json').body)
      
      @user["name"], @user["picture"] = result["name"], result["profile_image_url"]
      
      @service = "twitter"
      
    end
    
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
      
      # puts @access_token.post('/statuses/update.json', {:status => "testing 1 2 3"})
      
    end
    
    flash[:notice] = "thanks for posting to #{@post["service"]}"
    
    redirect_to root_path
    
  end

end
