require 'rails_helper'

RSpec.describe FavoritesController, :type => :controller do

  describe "GET #index" do
    before do
    @user = User.create(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: "password",
                avatar: Faker::Avatar.image,
                quirk: Faker::Lorem.sentence(7),
                tweet_size_advice: Faker::Lorem.sentence(3))
    session[:current_user_id] = @user.id
  end
    it "redirects to list of resources" do
      get :index, { :user_id => @user.id }
      expect(response).to render_template("index")
    end
  end

end
