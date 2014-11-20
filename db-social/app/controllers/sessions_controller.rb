class SessionsController < ApplicationController
  def create
    if user = User.authenticate(params:email),params[:password])
      session[:current_user_id] = user.current_user_id
      redirect_to posts_path
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end
