class PostsController < ApplicationController
  def index
    unless current_user
      redirect_to new_session_path
    end
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    params[:post][:user_id] = current_user.id
    @post = Post.new(post_params)
    if @post.save
      flash[:notice] = "Post created!!"
    else
      flash[:notice] = "Invalid Post!!"
    end
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:text, :user_id)
  end

end
