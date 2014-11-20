require 'rails_helper'

# RSpec.describe Comment, :type => :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end

describe Comment do
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

    @nil_comment = Comment.new(text: nil)
    @blank_comment = Comment.new(text: "")
    @valid_comment_141 = Comment.new(text: valid_string_141)
    @valid_comment_90 = Comment.new(text: valid_string_90)
    @invalid_comment = Comment.new(text: invalid_string_142)
  end

  context 'failed validations' do

    it 'fails validation when blank' do
      expect(@nil_comment).not_to be_valid
    end

    it 'fails validation when blank' do
      expect(@blank_comment).not_to be_valid
    end

    it 'fails when text field recieves 142 characters' do
      expect(@invalid_comment).not_to be_valid
    end

    it 'fails when text field recieves > 141 characters' do
      expect(@invalid_comment).not_to be_valid
    end

  end

  context 'passing validations' do

    it 'passes when text length is 90 characters' do
      expect(@valid_comment_90).to be_valid
    end

    it 'passes when text length is 141 characters' do
      expect(@valid_comment_141).to be_valid
    end

    it 'passes when text length is 1 to 140 characters' do
      expect(@valid_comment_90).to be_valid
    end

  end

  context 'Association' do

    it 'should respond to Post' do
      expect(@valid_comment_90).to respond_to(:post)
    end

  end

end
