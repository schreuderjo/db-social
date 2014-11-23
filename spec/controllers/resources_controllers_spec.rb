require 'rails_helper'

RSpec.describe ResourcesController, :type => :controller do
 let!(:user) {User.create(first_name: Faker::Name.first_name,
                          last_name: Faker::Name.last_name,
                          email: Faker::Internet.email,
                          password: "password",
                          avatar: Faker::Avatar.image,
                          quirk: Faker::Lorem.sentence(7),
                          tweet_size_advice: Faker::Lorem.sentence(3))}

 let!(:resource) {Resource.create(name: "DBCx",
                                  url: "http://googole.com",
                                  description: "site for googling things.",
                                  global_resource: false)}

  describe "GET #index" do
    it "redirects to list of resources" do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe "POST #create" do
    before do
    session[:current_user_id] = user.id
    end

    subject {post :create, {resource: {name: "DBCx",
                                       url: "http://googole.com",
                                       description: "site for googling things.",
                                       global_resource: false }}}

    context "when valid params are passed" do
      it "assigns a newly created resource as @resource" do
        subject
        expect(assigns(:resource)).to eq(Resource.last)
      end

      it "creates a new Resource" do
        expect{subject}.to change{Resource.count}.by(1)
      end

      it "redirects to user's favorite resources list" do
        expect(subject).to redirect_to("/users/#{user.id}/favorites")
      end
    end
  end

  describe "PUT #update" do
    before do
      session[:current_user_id] = user.id
    end
    subject {put :update, {id: resource.id,
                           resource: {name: "new",
                                      url: "new",
                                      description: "new"}}}

    context "when valid params are passed" do
      it "redirects to user's favorite resources list " do
        expect(subject).to redirect_to("/users/#{user.id}/favorites")
      end
    end

    context "when invalid params are passed" do
        subject {put :update, {id: resource.id,
                               resource: {name: "new",
                                          url: "",
                                          description: "new"}}}
      it "renders the edit form" do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    before do
      @favorite = Favorite.create(user_id: user.id, resource_id: resource.id)
      session[:current_user_id] = user.id
    end

    subject {delete :destroy, id: resource.id}

    it "redirects to user's favorite resources list" do
      expect(subject).to redirect_to("/users/#{user.id}/favorites")
    end
  end
end
