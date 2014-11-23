class FavoritesController < ApplicationController
  
  def index
    @favorite_resources = current_user.resources
  end

  def create
    params[:user_id] = current_user.id
    @resource = Resource.find(params[:resource_id])
    @favorite = Favorite.new(favorite_params)
    respond_to do |format|
      if @favorite.save
        format.json {
          render json: {html: render_to_string(:partial => "favorite_container.html.erb", :locals => {:favorite => @favorite, :resource => @resource} )}
        }
      end
    end
  end

  private
  def favorite_params
    params.permit(:resource_id, :user_id)
  end
  
end
