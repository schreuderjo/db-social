require 'rails_helper'

# RSpec.describe Post, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe User do
  before (:each) do

    valid_string_141 = ""
    141.times do
      valid_string_141 += 'a'.upto('z').to_a.sample
    end

    valid_string_90 = ""
    90.times do
      valid_string_90 += 'a'.upto('z').to_a.sample
    end

    invalid_string_142 = ""
    142.times do
      invalid_string_142 += 'a'.upto('z').to_a.sample
    end

    @nil_post = Post.new(text: nil)
    @blank_post = Post.new(text: "")
    @valid_post_141 = Post.new(text: valid_string_141)
    @valid_post_90 = Post.new(text: valid_string_90)
    @invalid_post = Post.new(text: invalid_string_142)
  end

  context 'failed validations' do

    it 'fails validation when blank' do
      expect(@nil_post).not_to be_valid
    end

    it 'fails validation when blank' do
      expect(@blank_post).not_to be_valid
    end

    it 'fails when text field recieves 142 characters' do
      expect(@invalid_post).not_to be_valid
    end

    it 'fails when text field recieves > 141 characters' do
      expect(@invalid_post).not_to be_valid
    end

  end

  context 'passing validations' do

    it 'passes when text length is 90 characters' do
      expect(@valid_post_90).to be_valid
    end

    it 'passes when text length is 141 characters' do
      expect(@valid_post_141).to be_valid
    end

    it 'passes when text length is 1 to 140 characters' do
      expect(@valid_post_90).to be_valid
    end

  end

  context 'Association' do

    it 'should respond to User' do
      expect(@valid_post_90).to respond_to(:user)
    end

    it 'should respond to Comment' do
      expect(@valid_post_90).to respond_to(:comments)
    end

    it 'should respond to Nice' do
      expect(@valid_post_90).to respond_to(:nices)
    end


  end

end
