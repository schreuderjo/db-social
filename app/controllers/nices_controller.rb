class NicesController < ApplicationController
  #maybe add logic to prevent save if user_id and post_id already exist in the
  #nice database
  def create
    params[:user_id] = current_user.id
    @post = Post.find(params[:post_id])
    @nice = Nice.new(post_params)
    respond_to do |format|
      if @nice.save
        format.json {
          render json: {html: render_to_string(:partial => "nice_container.html.erb", :locals => {:nice => @nice, :post => @post} )}
        }
      end
    end
  end

  private
  def post_params
    params.permit(:post_id, :user_id)
  end
end
