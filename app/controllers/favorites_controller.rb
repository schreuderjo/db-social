class FavoritesController < ApplicationController
  def index
    @favorite_resources = current_user.resources
  end
end
