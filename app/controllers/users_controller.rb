class UsersController < ApplicationController

  def index
    
    #if session[:user] && session[:user][:service] == "soundcloud"
      @users = User.all
    #else
      #redirect_to login_path("soundcloud")
    #end
    
  end
  
  def create
    
    @user = User.new(params[:user])

    if @user.save
      #session[:download] = true
      redirect_to root_path
    else
      redirect_to root_path
    end
    
  end
  
end
