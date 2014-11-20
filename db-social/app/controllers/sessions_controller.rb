class SessionsController < ApplicationController
  def create
    if @user = User.find_by(email: params[:user][:email])
      if @user.authenticate(params[:user][:password])
        session[:current_user_id] = @user.id
        redirect_to posts_path
      else
        flash[:notice] = "Invalid email or password."
        render '/sessions/index'
      end
    else
      flash[:notice] = "Invalid email or password."
      render '/sessions/index'
    end
  end

  def destroy
    session[:current_user_id] = nil
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end
