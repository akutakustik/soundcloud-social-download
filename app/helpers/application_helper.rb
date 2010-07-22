module ApplicationHelper
  
  def logged_in_facebook?
    session[:facebook] ? true : false
  end
  
end
