class ResourcesController < ApplicationController
  def index
    @resources = Resource.where(global_resource: true)
  end
end
