# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
User.create(first_name: "Aang", last_name: "the Avatar", email: "aang@gmail.com", password: "aaaaaa", avatar: "http://www.dan-dare.org/FreeFun/Images/CartoonsMoviesTV/AvatarTheLastAirbenderWallpaper800.jpg", quirk: "I was once frozen in an iceberg for 100 years.", tweet_size_advice: "If you surrender to the wind, you can ride it.")
