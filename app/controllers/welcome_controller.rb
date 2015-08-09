class WelcomeController < ApplicationController

  def index
  	if session[:user_id]
    	@name = User.find(session[:user_id])
    end
    @categories = Category.all
  end
end
