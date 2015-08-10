class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      @error = "Invalid Registration"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    if current_user == @user
      @starred_charities = current_user.charities
      @visited_charities = current_user.recently_visited_charities
      @categories = current_user.categories
    else
      redirect_to root_path
    end
  end

  private

    def user_params
      params.require(:user).permit(:username, :email, :password)
    end
end
