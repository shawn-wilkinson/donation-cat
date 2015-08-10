class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception


  def current_user
    if session[:user_id]
      if User.find(session[:user_id])
        @current_user ||= User.find(session[:user_id]) if session[:user_id]
      elsif Charity.find(session[:charity_id])
        @current_user ||= Charity.find(session[:charity_id]) if session[:charity_id]
      end
    end
  end

  helper_method :current_user

  def authorize
    redirect_to '/login' unless current_user
  end
end
