class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    if @user = User.find_by(email: params[:user][:email])
      if @user.authenticate(params[:user][:password])
        session[:current_user_id] = @user.id
        redirect_to '/'
      else
        flash.now[:notice] = "Invalid email or password."
        render '/sessions/new'
      end
    else
      flash.now[:notice] = "Invalid email or password."
      render '/sessions/new'
    end
  end

  def destroy
    session.clear
    flash[:notice] = "You have successfully logged out."
    redirect_to root_url
  end
end
