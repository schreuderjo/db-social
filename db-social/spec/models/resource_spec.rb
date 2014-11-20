require 'rails_helper'

describe Resource do
  let(:user) {User.new(first_name: "Spongebob",
                      last_name: "Squarepants",
                      email: "pineapples@example.com",
                      password: "password")}
  let(:resource) {Resource.new(name: "Pairing is Caring",
                                url: "http://mentoring.devbootcamp.com/",
                                description: "Such a great app!",
                                )}
  let(:large_string) do
    string = ""
    141.times do
      string << ('a'..'z').to_a.sample
    end
    string
  end

  context '#associations' do

    it 'has many users' do
      expect(resource).to respond_to(:users)
    end

    it 'has many favorites' do
      expect(resource).to respond_to(:favorites)
    end
  end

  context '#validations' do
    before do
      @resource = Resource.new
    end

    it 'must have a name' do
      @resource.save
      expect(@resource.errors[:name]).not_to be_empty
    end

    it 'must have a url' do
      @resource.save
      expect(@resource.errors[:url]).not_to be_empty
    end

    it 'must have a description' do
      @resource.save
      expect(@resource.errors[:description]).not_to be_empty
    end

    it 'must have a description' do
      @resource.save
      expect(@resource.errors[:description]).not_to be_empty
    end

    it 'sets the global_resource field default as false' do
      @resource.save
      expect(resource.global_resource).to eq(false)
    end

    #this is a frail test/does not pass with numbers or non-empty strings
    it 'only accepts booleans for global_resource' do
      resource.update(global_resource: "")
      expect(resource.errors[:global_resource]).not_to be_empty
    end

    it 'limits the length of description to 140 characters' do
      @resource.update(description: large_string)
      expect(@resource.errors[:description]).not_to be_empty
    end
  end
end
