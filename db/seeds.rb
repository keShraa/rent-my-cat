# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB..."

Booking.destroy_all
Cat.destroy_all
User.destroy_all


8.times do
  user = User.new(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(18..99))
  user.save!
  puts "#{user.first_name} saved !"
end


15.times do
  url = "https://source.unsplash.com/collection/139386/1000x1000/?sig="
  cat = Cat.new(
    name: Faker::Creature::Cat.name,
    breed: Cat::BREEDS.shuffle.first,
    address: Cat::CITY.shuffle.first,
    age: rand(1..22),
    gender: Cat::GENDER.shuffle.first,
    user_id: rand(1..8),
    price_per_day: rand(5..172),
    description: ["He is very friendly, loves playing and is very kind with children", "She sleeps all day and eats a lot. She loves going outside and eat the grass or play with insects" , "He loves watching TV and being pet. Excellent hunter, he might bring you mouses as a gift and will be very proud of it. He can easily escape so preferences for people whose house has fences"].shuffle.first
    )
  cat.remote_photo_url = url
  cat.save!
  puts "#{cat.name} saved !"
end

puts "Cats created!"
