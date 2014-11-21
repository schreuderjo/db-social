require 'rails_helper'

RSpec.describe ResourcesController, :type => :controller do

  describe "GET #index" do
    it "redirects to list of resources" do
      get :index
      expect(response).to render_template(:index)
    end
  end

end
