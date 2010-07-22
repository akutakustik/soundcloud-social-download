module ApplicationHelper
  
  def logged_in(service)
    session[service.to_sym] ? true : false
  end
  
end
