class PostsController < ApplicationController

  private
  def post_params
    params.require(:post).permit(:body)#needs to be updated when post model is available
  end

end
