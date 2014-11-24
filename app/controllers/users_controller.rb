class UsersController < ApplicationController

  def index
    if current_user.admin
      @users = User.where('id <> ?' , current_user.id).order('last_name ASC')
      render 'index'
    else
      redirect_to '/'
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "You have successfully signed up!"
      session[:current_user_id] = @user.id
      redirect_to '/'
    else
      @user.errors
      render new_user_path
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy_posts
    @user.destroy_resources
    @user.destroy_favorites
    @user.destroy
    redirect_to "/users"
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :quirk, :avatar, :tweet_size_advice)
  end

end
