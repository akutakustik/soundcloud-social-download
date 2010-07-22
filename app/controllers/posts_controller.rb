class PostsController < ApplicationController
  
  def new
    
    #puts session[:twitter].get('/statuses/friends_timeline.json')
    
    #puts Facebook.new(session[:facebook]).class.get('/me')
    
    #puts session[:twitter].inspect
    
    #@access_token = OAuth::AccessToken.new(consumer("twitter"), session[:twitter][:token], session[:twitter][:secret])
    
    #puts @access_token.get('/account/verify_credentials.json')
    
    #puts @access_token.post('/statuses/update.json', {:status => "testing 1 2 3"})
    
  end

  def create
    
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
    
  end

end
