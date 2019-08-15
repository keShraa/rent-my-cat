# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

def generate_random_name
  Faker::Creature::Cat.name
end

def generate_description
  Faker::Lorem.sentence(word_count: 10, supplemental: false, random_words_to_add: 10)
end

def generate_random_age
  rand(1..16)
end

def generate_random_price
  5 * rand(1..10)
end

def generate_random_photo

end

breed = ["Main Coon", "Bengal", "Birman", "Burmese", "Chartreux",
  "Persian", "Ragdoll", "Abyssinian", "Oriental Shorthair", "Sphynx", "Devon Rex",
  "British shorthair", "Himalayen", "Ocicat", "Somali", "Javanais"]

gender = ["Male", "Female"]

addresses = [
  "131 Avenue des Eyquems 33700 Mérignac",
  "34 Rue Armand Gayral 33700 Mérignac",
  "37 Rue Seguineau 33700 Mérignac",
  "32 Cours de Verdun 33000 Bordeaux",
  "76 Rue Ducau 33000 Bordeaux",
  "30 Rue des Chalets 33150 Cenon",
  "10 Rue Lucie Aubrac 33300 Bordeaux",
  "1 Rue Dr Jean Vincent 33300 Bordeaux",
  "19 Avenue Félix Faure 33200 Bordeaux",
  "1 Rue Guillaume Brochon 33000 Bordeaux",

]

users = []

10.times do
  user = User.new(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(18..99))
  user.save!
  users << user
  puts "Saved #{user.first_name}"
end

addresses.each do |address|
  url = "https://source.unsplash.com/collection/139386/100x100/?sig="
  new_cat = Cat.new()
  new_cat.name = generate_random_name
  new_cat.description = generate_description
  new_cat.address = address
  new_cat.breed = breed.sample
  new_cat.age = generate_random_age
  new_cat.price_per_day = generate_random_price
  new_cat.user = users.sample
  # new_cat.remote_photo_url = url
  new_cat.gender = gender.sample
  new_cat.save!
  puts "Saved #{new_cat.name}, #{new_cat.gender}, owned by #{new_cat.user.first_name}"
end
