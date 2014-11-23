class NicesController < ApplicationController
  def create
    # Nice.create!(  user_id: (1..10).to_a.sample,
    #                 post_id: (1..30).to_a.sample
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
