class PostsController < ApplicationController
  
  def new
    
    #puts Facebook.new(session[:facebook]).class.get('/me')
    
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
