class FavoritesController < ApplicationController

  def index
    @favorite_resources = current_user.resources
  end

  def create
    @favorite = Favorite.new(favorite_params)
    @resource = Resource.find(params[:resource_id])
    respond_to do |format|
      if @favorite.save
        format.json {
          render json: {html: render_to_string(:partial => "favorite_partial.html.erb", :locals => {:resource => @resource} )}
        }
      end
    end
  end

  private
  def favorite_params
    params.permit(:resource_id, :user_id)
  end

end
