# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# user1 = User.create(first_name: "Aang", last_name: "the Avatar", email: "aang@gmail.com", password: "aaaaaa", avatar: "http://www.dan-dare.org/FreeFun/Images/CartoonsMoviesTV/AvatarTheLastAirbenderWallpaper800.jpg", quirk: "I was once frozen in an iceberg for 100 years.", tweet_size_advice: "If you surrender to the wind, you can ride it.")
# user2 = User.create(first_name: "Aang", last_name: "the Avatar", email: "aang@gmail.com", password: "aaaaaa", avatar: "http://www.dan-dare.org/FreeFun/Images/CartoonsMoviesTV/AvatarTheLastAirbenderWallpaper800.jpg", quirk: "I was once frozen in an iceberg for 100 years.", tweet_size_advice: "If you surrender to the wind, you can ride it.")

10.times do
  User.create!( first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: Faker::Internet.email,
                password: "password",
                avatar: Faker::Avatar.image,
                quirk: Faker::Lorem.sentence(7),
                tweet_size_advice: Faker::Lorem.sentence(3) )
end

30.times do
  Post.create!(   user_id: (1..10).to_a.sample,
                  text: Faker::Lorem.sentence(5), )
end

60.times do
  Comment.create!(  post_id: (1..30).to_a.sample,
                    user_id: (1..10).to_a.sample,
                    text: Faker::Lorem.sentence(8)  )
end

50.times do
  Resource.create!(   name: Faker::Lorem.words(2).join(" "),
                      url: Faker::Internet.url,
                      description: Faker::Lorem.sentence(5),
                      global_resource: false )
end

20.times do
  Favorite.create!( user_id: (1..10).to_a.sample,
                    resource_id: (1..30).to_a.sample )
end

600.times do
  Nice.create!(  user_id: (1..10).to_a.sample,
                    post_id: (1..30).to_a.sample  )
end

Resource.create!( name: "Pairing is Caring",
                  url: "http://mentoring.devbootcamp.com",
                  description: "Sign up for a DBC Mentor to pair with, or Offer to Mentor DBC students.",
                  global_resource: true)

Resource.create!( name: "Counseling at Dev Bootcamp",
                  url: "http://counseling-devbootcamp.herokuapp.com",
                  description: "Meet with a counselor on premises.",
                  global_resource: true)

Resource.create!( name: "DBC Talks",
                  url: "http://talks.devbootcamp.com",
                  description: "View past lectures given at DBC.",
                  global_resource: true)

Resource.create!( name: "SQL Designer",
                  url: "http://socrates.devbootcamp.com/sql",
                  description: "Design tool for database schemas",
                  global_resource: true)

Resource.create!( name: "Educational Counseling at Dev Bootcamp",
                  url: "https://docs.google.com/spreadsheets/d/1ttA3-4nkxeWIECzQST3nH6cT2OytHFkJrCuT4DwLNdU/edit#gid=0",
                  description: "Google Docs: Sign up to meet with an educational counselor on premises",
                  global_resource: true)

Resource.create!( name: "SQL Designer",
                  url: "http://socrates.devbootcamp.com/sql",
                  description: "Design tool for database schemas",
                  global_resource: true)

Resource.create!( name: "DBCx",
                  url: "http://meetup.com/Chicago-DevBootcamp-Speaker-Series",
                  description: "DevBootcamp brings a speaker from the development community in once a week to talk about tech topics.",
                  global_resource: true)

Resource.create!( name: "Ruby Docs",
                  url: "http://ruby-doc.org/core-2.0.0/",
                  description: "Ruby Core 2.0.0 documentation",
                  global_resource: true)

Resource.create!( name: "Learn CSS Layout",
                  url: "http://learnlayout.com/",
                  description: "This site teaches the CSS fundamentals that are used in any website's layout.",
                  global_resource: true)

Resource.create!( name: "Events",
                  url: "https://www.google.com/calendar/embed?src=devbootcamp.com_3t7sqtcfo3uol2gj0o60r36r7g%40group.calendar.google.com&ctz=America/Chicago",
                  description: "Search for Dev Bootcamp events in Chicago",
                  global_resource: true)

Resource.create!( name: "Meme Overflow",
                  url: "http://www.memeoverflow.com/",
                  description: "View, create, and vote on DBC Chicago memes.",
                  global_resource: true)

User.create!(first_name: Faker::Name.first_name,
                last_name: Faker::Name.last_name,
                email: "z@z.com",
                password: "password",
                avatar: Faker::Avatar.image,
                quirk: Faker::Lorem.sentence(7),
                tweet_size_advice: Faker::Lorem.sentence(3))
Resource.all.each do |resource|
  Favorite.create!(user_id: User.last.id, resource_id: resource.id)
end




