require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

  before do
    User.create(first_name: "Aang", last_name: "the Avatar", email: "aang@gmail.com", password: "aaaaaa")
  end

  describe "POST create" do

    context "when valid email and valid password are passed" do
      subject {post :create, {user: {email: "aang@gmail.com", password: "aaaaaa"}}}
      it "redirects to posts page" do
        expect(subject).to redirect_to posts_path
      end
      it "creates a new session" do
        pending
      #   binding.pry
      #   expect{subject}.to
      end
    end

    context "when email not found in the database" do
      subject {post :create, {user: {email: "bozo@gmail.com", password: "aaaaaa"}}}
      it "renders the sign in page" do
        expect(subject).to render_template('index')
      end
    end

    context "when email is found, but password is invalid" do
      subject {post :create, {user: {email: "aang@gmail.com", password: "a"}}}
      it "renders the sign in page" do
        expect(subject).to render_template('index')
      end
    end

  end
end


