class IndexController < ApplicationController

  def welcome
    if session[:user_id]
      @name = User.find(session[:user_id])
    end
  end


end