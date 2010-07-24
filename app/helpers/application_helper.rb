module ApplicationHelper
  
  def logged_in(service)
    if session[:user]
      session[:user][:service] == service ? true : false
    end
  end
  
end
