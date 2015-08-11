class WelcomeController < ApplicationController

  def index
  	if session[:user_id]
    	@name = User.find(session[:user_id])
    end
    @categories = Category.all
  end


  def about
  	if session[:user_id]
    	@name = User.find(session[:user_id])
    end
  end

  def news
  end


end
