class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id] 
  end
  helper_method :current_user

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]     
  end
  helper_method :current_admin
end
