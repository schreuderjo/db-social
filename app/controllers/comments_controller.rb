class CommentsController < ApplicationController
  def new
    # binding.pry
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.json {
          render json: {postId: params[:post_id], html: render_to_string(:partial => "new_comment.html.erb", :locals => {:post => @post} )}
        }
    end
  end

  def create
    # binding.pry
    params[:post][:user_id] = current_user.id
    @post = Post.find(params[:post_id])
    @comment = Comment.new(user_id: params,text: params[:comment][:text])
    respond_to do |format|
      if @comment.save
      format.json {
          render json: {postId: params[:post_id], html: render_to_string(:partial => "new_comment.html.erb", :locals => {:post => @post} )}
        }
      end
    end
  end
end
