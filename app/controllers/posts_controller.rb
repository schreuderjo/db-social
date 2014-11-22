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
    respond_to do |format|
      if @post.save
        format.json {
          render json: {html: render_to_string(:partial => "show_post.html.erb", :locals => {:post => @post} )}
        }
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to root_path
  end

  private
  def post_params
    params.require(:post).permit(:text, :user_id)
  end

end
