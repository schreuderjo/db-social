class PostsController < ApplicationController

  def index
    unless current_user
      redirect_to new_session_path
    end
    @posts = Post.order("created_at DESC")
  end

  def show
    @post = Post.find(params[:id])
    respond_to do |format|
        format.json {
          render json: {html: render_to_string(:partial => "edit_post.html.erb", :locals => {:post => @post} )}
        }
    end
  end

  def create
    params[:post][:user_id] = current_user.id
    @post = Post.new(post_params)
    respond_to do |format|
      if @post.save
        format.json {
          render json: {html: render_to_string(:partial => "post_container.html.erb", :locals => {:post => @post} )}
        }
      end
    end
  end

  def destroy
    post = Post.find(params[:id])
    post.destroy
    respond_to do |format|
      format.json {
        render json: {postId: post.id}
      }
    end
  end

  def update
    params[:post][:user_id] = current_user.id
    @post = Post.find(params[:id])
    @post.update(post_params)
    respond_to do |format|
      if @post.save
        format.json {
          render json: {html: render_to_string(:partial => "post_partial.html.erb", :locals => {:post => @post} )}
        }
      end
    end
  end

  private
  def post_params
    params.require(:post).permit(:text, :user_id)
  end

end
