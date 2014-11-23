class PasswordsController < ApplicationController

  def edit
    @user = User.find(params[:id])
    render 'passwords/edit'
  end

  def update
    @user = User.find(params[:id])
    if params[:user][:password] != ""
      if @user.authenticate(params[:user][:current_password]) 
        if @user.update(user_params)
          redirect_to @user
        else
          @error = "Incorrect or invalid password"
          render 'passwords/edit'
        end
      else
        @error = "Incorrect or invalid password"
        render 'passwords/edit'
      end
    else
      @error = "Incorrect or invalid password"
      render 'passwords/edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:password)
  end

end