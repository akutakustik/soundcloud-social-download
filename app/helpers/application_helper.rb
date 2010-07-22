module ApplicationHelper
  
  def logged_in(service)
    session[service] ? true : false
  end
  
end
