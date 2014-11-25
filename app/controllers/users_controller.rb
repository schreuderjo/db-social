class UsersController < ApplicationController

  def index
    if current_user.admin
      @users = User.where('email <> ?' , "admin@admin.com").order('last_name ASC')
      @user
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

    if params[:admin]
      params[:user][:admin] = true
    else
      unless @user == current_user
        params[:user][:admin] = false
      end
    end

    if @user.update(user_params)
      if params[:user][:admin] != nil
        redirect_to '/users'
      else
        redirect_to @user
      end
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy_user
    redirect_to "/users"
  end


  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :quirk, :avatar, :tweet_size_advice, :admin)
  end

end
