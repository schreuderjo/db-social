require 'rails_helper'
require 'capybara'

RSpec.describe SessionsController, :type => :controller do

  before do
    @user = User.create(first_name: "Aang", last_name: "the Avatar", email: "aang@gmail.com", password: "aaaaaa")
  end

  describe "#create" do

    context "when valid email and valid password are passed" do
      subject {post :create, {user: {email: "aang@gmail.com", password: "aaaaaa"}}}

      it "redirects to home" do
        expect(subject).to redirect_to '/'
      end

      it 'creates a new session' do
        expect(response.code).to eq("200")
      end
    end

  end
end



