require 'rails_helper'

describe User do
  before (:each) do
    @valid_user = User.new(first_name: "Spongebob", last_name: "Squarepants", email: "pineapples@example.com", password: "password")
    @repeate_email = User.new(first_name: "Spongebob", last_name: "Squarepants", email: "pineapples@example.com", password: "password")
    @missing_first_name = User.new(last_name: "Squarepants", email: "pineapples@example.com", password: "password")
    @missing_last_name = User.new(first_name: "Spongebob", email: "pineapples@example.com", password: "password")
    @missing_email = User.new(first_name: "Spongebob", last_name: "Squarepants", password: "password")
    @missing_password = User.new(first_name: "Spongebob", last_name: "Squarepants", email: "pineapples@example.com")
    @invalid_password_length = User.new(first_name: "Spongebob", last_name: "Squarepants", email: "pineapples@example.com", password: "passw")

    @invalid_emails = %w(jo%@jim.co bob.bob$@bob.com @example.com bob.com bob@example)
  end

  context 'failed validations' do

    it 'fails validation when first_name is missing' do
      expect(@missing_first_name).not_to be_valid
    end

    it 'fails when last_name is missing' do
      expect(@missing_last_name).not_to be_valid
    end

    it 'fails when email is missing' do
      expect(@missing_email).not_to be_valid
    end

    it 'fails when password is missing' do
      expect(@missing_password).not_to be_valid
    end

    it 'fails when password length is less than 6' do
      expect(@invalid_password_length).not_to be_valid
    end

    it 'fails when tweet_size_advice length is greater than 140' do
      @valid_user.tweet_size_advice = ("z"*141)
      @tweet_advice_too_long = @valid_user
      expect(@tweet_advice_too_long).not_to be_valid
    end

    it 'fails when email is invalid' do
      @invalid_emails.each do |email|
        user = User.new(first_name: "Spongebob", last_name: "Squarepants", email: email, password: "password")
        expect(user).not_to be_valid
      end
    end
  end

  context 'passing validations' do
    it 'passes when all required fields are valid' do
      expect(@valid_user).to be_valid
    end
  end

  context 'associations' do
    it 'has a nices method' do
      expect(@valid_user).to respond_to(:nices)
    end

    it 'has a posts method' do
      expect(@valid_user).to respond_to(:posts)
    end

    it 'has a comments method' do
      expect(@valid_user).to respond_to(:comments)
    end

    it 'has a resources method' do
      expect(@valid_user).to respond_to(:resources)
    end

  end
end
