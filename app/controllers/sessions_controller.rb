class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by_username(params[:username])
    p params[:username]
    @user
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      session[:charity_id] = nil
      redirect_to '/'
    else
      render :new
      @error = "Invalid Login"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end

end