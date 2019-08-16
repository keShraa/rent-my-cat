def generate_random_name
  Faker::Creature::Cat.name
end

def generate_description
  Faker::Lorem.sentence(word_count: 60, supplemental: false, random_words_to_add: 30)
end

def generate_random_age
  rand(1..16)
end

def generate_random_price
  5 * rand(1..10)
end

def clear
  system "cls" or system "clear"
end

def make_cat (address, breeds, users, genders)
  url = "https://source.unsplash.com/featured/?cat/1000x1000"
  new_cat = Cat.new()
  new_cat.name = generate_random_name
  new_cat.description = generate_description
  new_cat.address = address
  new_cat.breed = breeds.sample
  new_cat.age = generate_random_age
  new_cat.price_per_day = generate_random_price
  new_cat.user = users.sample
  new_cat.remote_photo_url = url
  new_cat.gender = genders.sample
  new_cat.save!
  rand(2..6).times do
    review = Review.new(description: Faker::Lorem.sentence(word_count: 30, supplemental: false, random_words_to_add: 20), rating: rand(1..5), user: users.sample)
    review.cat = new_cat
    review.save
  end
  clear
end

def waiting
  print "\nWaiting 3 seconds."
  sleep 1
  print "."
  sleep 1
  print "."
  sleep 1
end

clear

breeds = ["Main Coon", "Bengal", "Birman", "Burmese", "Chartreux",
  "Persian", "Ragdoll", "Abyssinian", "Oriental Shorthair", "Sphynx", "Devon Rex",
  "British shorthair", "Himalayen", "Ocicat", "Somali", "Javanais"]

genders = ["Male", "Female"]

# Just add address in the hash bellow. Every address will be allocated a new cat.

addresses = [
  "131 Avenue des Eyquems Mérignac",
  "34 Rue Armand Gayral Mérignac",
  "37 Rue Seguineau Mérignac",
  "20 Rue Seguineau Mérignac",
  "1 Rue Seguineau Mérignac",
  "32 Cours de Verdun Bordeaux",
  "76 Rue Ducau Bordeaux",
  "30 Rue des Chalets Cenon",
  "10 Rue Lucie Aubrac Bordeaux",
  "22 Rue du Petit Goave 33000 Bordeaux",
  "19 Avenue Félix Faure Bordeaux",
  "1 Rue Guillaume Brochon Bordeaux",
]

users = []

cpt = 0
times = 10
times.times do
  cpt += 1
  puts "[#{cpt}/#{times}] Building users..."
  user = User.new(email: Faker::Internet.email, password: "password", first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, age: rand(18..99))
  puts "Downloading image for #{user.first_name}..."
  user.remote_photo_url = "https://source.unsplash.com/featured/?visage/1000x1000"
  # waiting
  user.save!
  users << user
  clear
end

cpt = 0
addresses.each do |address|
  cpt += 1
  make_cat(address, breeds, users, genders)
  puts "|\\---/|
| o_o |
 \\_^_/
 "
  puts "[#{cpt}/#{addresses.length}] Saved new cat : #{Cat.last.name}, #{Cat.last.gender}, owned by #{Cat.last.user.first_name}"
  # waiting
end

puts "\nBuilding tests accounts..."
owner = User.new(address: "18 Rue de la Boétie 33000 Bordeaux", email: "owner@exemple.com", password: "123456", first_name: "Jean-Julien", last_name: Faker::Name.last_name, age: rand(18..99))
booker = User.new(address: "20 Avenue de la gastronomie asiatique, Bordeaux", email: "booker@exemple.com", password: "123456", first_name: "Jean-Serge", last_name: Faker::Name.last_name, age: rand(18..99))
owner.remote_photo_url = "https://source.unsplash.com/featured/?visage/1000x1000"
booker.remote_photo_url = "https://source.unsplash.com/featured/?woman/1000x1000"
owner.save!
booker.save!

test_owner_cats = []
cpt = 0
times = 7
times.times do
  url = "https://source.unsplash.com/featured/?cat/1000x1000"
  new_cat = Cat.new()
  new_cat.name = generate_random_name
  new_cat.description = generate_description
  new_cat.address = "18 Rue de la Boétie 33000 Bordeaux"
  new_cat.breed = breeds.sample
  new_cat.age = generate_random_age
  new_cat.price_per_day = generate_random_price
  new_cat.user = owner
  new_cat.remote_photo_url = url
  new_cat.gender = genders.sample
  new_cat.save!
  test_owner_cats.push(new_cat)
  cpt += 1
  clear
  puts "Creating cats of test-owner..."
  puts "[#{cpt}/#{times}] Saved new cat : #{new_cat.name}, #{new_cat.gender}, owned by #{new_cat.user.first_name}"
  # waiting
end

clear

puts "Making random reviews for test-owner's cats..."
test_owner_cats.each do |cat|
  rand(2..6).times do
    review = Review.new(description: Faker::Lorem.sentence(word_count: 30, supplemental: false, random_words_to_add: 20), rating: rand(1..5), user: users.sample)
    review.cat = cat
    review.save
  end
end

clear

puts "Testing account informations:"
puts ""
puts "Owner (7 cats)"
puts "email: owner@exemple.com"
puts "password: 123456"
puts ""
puts "Booker (Has to do booking yet)"
puts "email: booker@exemple.com"
puts "password: 123456"
puts ""


