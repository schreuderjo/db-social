require 'rails_helper'

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
    it "assigns a new user" do
      get :new
      expect(assigns(:user)).to be_instance_of(User)
    end

    it "renders the 'new' template" do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    subject {post :create, {user: {first_name: "Jane", last_name: "Doe", email: "janedoe@gmail.com", password: "123456"}}}

    context "when valid params are passed" do
      it "assigns a newly created user as @user" do
        subject
        expect(assigns(:user)).to eq(User.last)
      end

      it "creates a new User" do
        expect{subject}.to change{User.count}.by(1)
      end

      it "redirects to the root" do
        expect(subject).to redirect_to(:root)
      end
    end

    context "when invalid params are passed" do
      subject {post :create, {user: {first_name: "Jane", last_name: "Doe", email: "janedoe@gmail.com", password: "121"}}}
      it "re-renders the 'new' template" do
        subject
        expect(response).to render_template(:new)
      end
    end
  end
end
