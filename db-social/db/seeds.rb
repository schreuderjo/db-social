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
                    text: Faker::Lorem.sentence(8)  )
end

30.times do
  Resource.create!(   name: Faker::Lorem.words(2).join(" "),
                      url: Faker::Internet.url,
                      description: Faker::Lorem.sentence(5),
                      global_resource: ([true, false, false].sample)  )
end

20.times do
  Favorite.create!( user_id: (1..10).to_a.sample,
                    resource_id: (1..30).to_a.sample )
end

600.times do
  Nice.create!(  user_id: (1..10).to_a.sample,
                    post_id: (1..30).to_a.sample  )
end






