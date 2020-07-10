class SessionsController < ApplicationController
  before_action :already_logged_in, only: [:new, :create]
  def new
    
  end

  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id 
      flash[:success] = 'You have successfully logged in'
      redirect_to root_path
    else
      flash.now[:error] = 'Something wrong with your credentials'
      render :new 
    end
  end
  
  def destroy
    session[:user_id] = nil 
    flash[:success] = 'You have successfully logged out'
    redirect_to login_path
  end
  
  private 

  def already_logged_in
    if logged_in?
      flash[:error] = 'Your are already logged in'
      redirect_to root_path 
    end
  end
  
  
end
