class ResourcesController < ApplicationController
  def index
    @resources = Resource.where(global_resource: true)
  end
end

#########################################################################

class ResourcesController < ApplicationController
  def index
    @resources = Resource.where(global_resource: true)
  end

  def create
    @resource = Resource.new(resource_params)
    if @resource.save
      @favorite = Favorite.new(resource_id: @resource.id, user_id: current_user.id)
      @favorite.save
      redirect_to "/users/#{current_user.id}/favorites"
    else
      render "/favorites/index"
    end
  end

  def edit
    @resource = Resource.find(params[:id])
  end

  def update
    @resource = Resource.find(params[:id])
    if @resource.update(resource_params)
      redirect_to "/users/#{current_user.id}/favorites"
    else
      render 'edit'
    end
  end

  def destroy
    @resource = Resource.find(params[:id])
    @resource.destroy
    @resource.favorites.where(user_id: current_user.id).first.destroy
    redirect_to "/users/#{current_user.id}/favorites"
  end

   private
  def resource_params
    params.require(:resource).permit(:name, :url, :description)
  end

end
