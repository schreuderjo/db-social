class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
      redirect_to root_path
    else
      @errors = @user.errors
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
    # redirect_to "/#{@user.to_param}" #attempt at changing route to first_name instead of id
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    params[:user].delete(:password) if params[:user][:password].blank?
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :quirk, :avatar, :tweet_size_advice)
  end

end