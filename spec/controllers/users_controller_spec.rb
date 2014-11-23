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

    context "when valid params are passed" do
      subject {post :create, {user: {first_name: "Jane",
                                     last_name: "Doe",
                                     email: "janedoe@gmail.com",
                                     password: "123456"}}}
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
      subject {post :create, {user: {first_name: "Jane",
                                     last_name: "Doe",
                                     email: "janedoe@gmail.com",
                                     password: "121"}}}
      it "re-renders the 'new' template" do
        subject
        expect(response).to render_template(:new)
      end
    end
  end

  describe "PUT #update" do
    before do
      @user = User.create!(first_name: "Jane",
                           last_name: "Doe",
                           email: "janedoe@gmail.com",
                           password: "123456")
    end
    context "when valid params are passed" do
      subject {put :update, {id: @user.id,
                             user: {first_name: "Jane",
                                    last_name: "Doe",
                                    email: "janedoe@gmail.com",
                                    quirk: "I like turtles",
                                    tweet_size_advice: "Just do it.",
                                    avatar: "http://images.com/jane.jpg"}}}
      it "finds a user and assignes them as @user" do
        subject
        expect(assigns(:user)).to eq(User.find(@user.id))
      end

      it "redirects to user's profile page" do
        expect(subject).to redirect_to("/users/#{@user.id}")
      end
    end
    context "when invalid email is passed" do
      subject {put :update, {id: @user.id,
                             user: {first_name: "Jane",
                                    last_name: "Doe",
                                    email: ""}}}
      it "renders user's 'edit' template" do
        subject
        expect(response).to render_template(:edit)
      end
    end
    context "when invalid first_name is passed" do
      subject {put :update, {id: @user.id,
                             user: {first_name: "",
                                    last_name: "Doe",
                                    email: "janedoe@gmail.com"}}}
      it "renders user's 'edit' template" do
        subject
        expect(response).to render_template(:edit)
      end
    end
    context "when invalid last_name is passed" do
      subject {put :update, {id: @user.id,
                             user: {first_name: "Jane",
                                    last_name: "",
                                    email: "janedoe@gmail.com"}}}
      it "renders user's 'edit' template" do
        subject
        expect(response).to render_template(:edit)
      end
    end
  end
end
