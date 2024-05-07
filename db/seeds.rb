# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Création d'utilisateurs

# Création d'utilisateurs


require "faker"

Event.destroy_all
User.destroy_all
Attendance.destroy_all

# Création d'utilisateurs
10.times do 
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph(sentence_count:2),
    email: "user#{rand(1..1000)}@yopmail.com" 
  )
end

puts "Users seeded"

# Création d'événements associés à des utilisateurs existants
10.times do
  user = User.order("RANDOM()").first
  event = Event.create(
    title: Faker::Lorem.sentence(word_count: rand(5..20)),
    description: Faker::Lorem.paragraph(sentence_count: 2),
    price: rand(1..1000),
    location: Faker::Address.city,
    start_date: Faker::Date.forward(days: 50),
    duration: (rand(1..1000)) * 5,
    user_id: user.id
  )
end

puts "Events seeded"