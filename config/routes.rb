ActionController::Routing::Routes.draw do |map|
  
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.resource :session
  map.resources :posts
  
  map.twitter_callback '/oauth_callback/twitter', :controller => 'sessions', :action => 'oauth_callback', :service => 'twitter'
  map.facebook_callback '/oauth_callback/facebook', :controller => 'sessions', :action => 'oauth_callback', :service => 'facebook'
  
  map.root :controller => "posts", :action => "new"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
