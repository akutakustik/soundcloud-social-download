# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def logged_in_facebook?
    session[:facebook] ? true : false
  end
  
  protected
  
  def consumer
    
    @consumer ||= OAuth::Consumer.new(
      "D9tonxAqgH73v3h3bIPNTA", "hfcEuzoHRSKDVzaPkxQZHrX3bDjOHnNtaGIEnMw", {:site => 'https://twitter.com'}
    )
    
  end
  
end
