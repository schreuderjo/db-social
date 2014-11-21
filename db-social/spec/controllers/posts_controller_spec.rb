require 'rails_helper'
require 'capybara'

RSpec.describe PostsController, :type => :controller do

  before do
    @user = User.create(first_name: "Aang", last_name: "the Avatar", email: "aang@gmail.com", password: "aaaaaa")
  end

end
