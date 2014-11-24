class CommentsController < ApplicationController
  # def new
  #   @post = Post.find(params[:post_id])
  #   respond_to do |format|
  #     format.json {
  #         render json: {postId: params[:post_id], html: render_to_string(:partial => "comment_form.html.erb", :locals => {:post => @post} )}
  #       }
  #   end
  # end

  def create
    @post = Post.find(params[:post_id])
    params[:comment][:user_id] = current_user.id
    params[:comment][:post_id] = @post.id
    @comment = Comment.new(comment_params)
    respond_to do |format|
      if @comment.save
      format.json {
          render json: {html: render_to_string(:partial => "show_comment.html.erb", :locals => {:comment => @comment} )}
        }
      end
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :user_id, :post_id)
  end
end
