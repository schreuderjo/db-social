require 'rails_helper'

feature "User clicks on resources link" do
  scenario "Sees a list of DBC resources" do
    visit '/resources'
    expect(find('h1').text).to eq("DBC Resources")
  end
end

