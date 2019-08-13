# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Cleaning DB..."

Cat.destroy_all
User.destroy_all
Booking.destroy_all

25.times do
  user = User.new(email: Faker::Internet.email, password: "password")
  user.save!
end


50.times do
  url = "https://source.unsplash.com/collection/139386/1000x1000/?sig="
  cat = Cat.new(
    name: Faker::Creature::Cat.name,
    breed: Cat::BREEDS,
    address: ["Bordeaux", "Paris", "Lille", "Marseille", "Lyon", "Nice", "Cannes", "Montpellier", "Dijon", "Metz", "Strasbourg", "Toulouse", "Brest", "Avignon", "Bayonne"].shuffle.first,
    age: rand(1..22),
    user_id: rand(1..25),
    price_per_day: rand(5..172),
    description: ["He is very friendly, loves playing and is very kind with children", "She sleeps all day and eats a lot. She loves going outside and eat the grass or play with insects" , "He loves watching TV and being pet. Excellent hunter, he might bring you mouses as a gift and will be very proud of it. He can easily escape so preferences for people whose house has fences"].shuffle.first
    )
  cat.remote_photo_url = url
  cat.save!
end

puts "Cats created!"
