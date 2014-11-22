require 'rails_helper'

RSpec.describe PasswordsController, :type => :controller do

  describe "GET #edit" do
    before do
      @user = User.create!(first_name: "Jane",
                           last_name: "Doe",
                           email: "janedoe@gmail.com",
                           password: "123456")
    end
    it "renders the password 'edit' template" do
      get :edit, {id: @user.id}
      expect(response).to render_template(:edit)
    end
  end

  describe 'PUT #update' do
    before do
      @user = User.create!(first_name: "Jane",
                           last_name: "Doe",
                           email: "janedoe@gmail.com",
                           password: "123456")
    end
    context 'when valid params are passed' do
      subject {put :update, { id: @user.id,
                              user: { current_password: "123456",
                                      password: "newpassword"}}}
      it "finds a user and assignes them as @user" do
        subject
        expect(assigns(:user)).to eq(User.find(@user.id))
      end

      it "redirects to user's profile page" do
        expect(subject).to redirect_to("/users/#{@user.id}")
      end
    end

    context "when invalid current password is entered" do
      subject {put :update, { id: @user.id,
                              user: { current_password: "wrongpassword",
                                      password: "newpassword"}}}
      it "renders the passwords 'edit' page" do
        subject
        expect(response).to render_template(:edit)
      end
    end

    context "when valid current_password and blank new password are entered" do
      subject {put :update, { id: @user.id,
                              user: { current_password: "123456",
                                      password: ""}}}
      it "renders the passwords 'edit' page" do
        subject
        expect(response).to render_template(:edit)
      end
    end

    context "when valid current_password and invald (too short) new password are entered" do
      subject {put :update, { id: @user.id,
                              user: { current_password: "123456",
                                      password: "short"}}}
      it "renders the passwords 'edit' page" do
        subject
        expect(response).to render_template(:edit)
      end
    end
  end
end




