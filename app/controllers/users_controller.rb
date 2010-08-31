class UsersController < ApplicationController

  def index
    
    @users = User.all
    
  end
  
  def create
    
    @user = User.new(params[:user])

    if @user.save
      flash[:notice] = 'User was successfully created.'
      redirect_to(@user)
    else
      render :action => "new"
    end
    
  end
  
end
