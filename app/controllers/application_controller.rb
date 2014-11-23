class ApplicationController < ActionController::Base
  def current_user
    @_current_user ||= session[:current_user_id] && User.find_by(id: session[:current_user_id])
  end
  helper_method :current_user

  def current_user_by_auth_token
    @_current_user_by_auth_token ||= User.find_by_auth_token!(cookies[:auth_token]) if cookies[:auth_token]
  end
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
end
