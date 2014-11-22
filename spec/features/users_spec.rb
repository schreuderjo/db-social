require 'rails_helper'

feature "User clicks on their profile picture in posts 'index' template" do
  before do
    @user = User.create(first_name: "Jane",
                 last_name: "Doe",
                 email: "janedoe@gmail.com",
                 password: "123456")
  end

  # scenario "Sees a user's profile image" do
  #   pending
  #   visit '/resources'
  #   expect(find('h1').text).to eq("DBC Resources")
  # end
end


#THIS IS AN EXAMPLE CAPYBARA TEST FROM ROCKET-PAPER_PLANE-SCISSORS - solo-luminous14 branch
# require 'rails_helper'

# feature "User playing the game" do
#   scenario "when user wins game" do
#     visit '/games/new'
#     allow_any_instance_of(Game).to receive(:computer_throw).and_return("scissors")
#     page.find(".btn-danger").click
#     expect(page).to have_text("User won!!")
#     expect(page).to have_text("melts")
#     expect(page).to have_selector(".text-danger")
#     expect(page).to have_selector(".text-info")
#   end

#   scenario "when user loses game" do
#     visit '/games/new'
#     allow_any_instance_of(Game).to receive(:computer_throw).and_return("scissors")
#     page.find(".btn-success").click
#     expect(page).to have_text("Computer won!!")
#     expect(page).to have_text("cut")
#     expect(page).to have_selector(".text-success")
#     expect(page).to have_selector(".text-info")
#     # stub the games action choice
#     # user chooses action
#     # user sees user won and the action outcome
#   end
# end

# feature "User visits website" do
#   scenario "sees a list of games and can view them" do
#     visit '/games'
#     5.times do
#       Game.create(user_throw: 'rocket')
#     end
#       save_and_open_page
#   end

#   scenario "can start a new game" do
#     pending
#   end
# end
