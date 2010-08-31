class UsersController < ApplicationController

  def index
    
    @users = User.all
    
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
