class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :ensure_login
  helper_method :logged_in?, :current_user # make available to views

  protected

  def logged_in?
  	return session[:user_id]
  end

  def current_user
  	if logged_in? 
  		@current_user ||= User.find(session[:user_id])
  	else
  		@current_user = nil
  	end
  	return @current_user
  end

  def ensure_login
  	redirect_to login_path unless logged_in?
  end
end
