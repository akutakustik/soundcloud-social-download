ActionController::Routing::Routes.draw do |map|
  
  map.login '/login', :controller => 'sessions', :action => 'new'
  map.logout '/logout', :controller => 'sessions', :action => 'destroy'
  
  map.resource :session
  map.resources :posts
  
  map.twitter_callback '/oauth_callback', :controller => 'sessions', :action => 'oauth_callback', :service => 'twitter'
  
  map.oauth_callback '/oauth_callback', :controller => 'sessions', :action => 'oauth_callback'
  
  map.root :controller => "posts", :action => "new"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
  
end
