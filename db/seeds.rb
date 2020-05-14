# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts "Now seeding database..."

Person.create!(title: "Mrs.",
               first_name: "Clara",
               last_name: "Schumann",
               suffix: nil,
               ring_size: 33.5,
               ring_size_notes: "Will need to resize next visit",
               necklace_length: 40.0,
               necklace_length_notes: "Prefers very lightweight necklaces. Too short better than too long.")

99.times do |n|
  title                  = Faker::Name.prefix
  first_name             = Faker::Name.first_name
  last_name              = Faker::Name.last_name
  suffix                 = Faker::Name.suffix
  ring_size              = rand(30.0..40.0)
  ring_size_notes        = Faker::Movies::StarWars.quote
  necklace_length        = rand(30.0..40.0)
  necklace_length_notes  = Faker::Movies::StarWars.quote
  birthday               = Faker::Date.birthday(min_age: 25, max_age: 82)
  Person.create!(title: title,
                 first_name: first_name,
                 last_name: last_name,
                 suffix: suffix,
                 ring_size: ring_size,
                 ring_size_notes: ring_size_notes,
                 necklace_length: necklace_length,
                 necklace_length_notes: necklace_length_notes,
                 birthday: birthday)
end

puts 'DB seeded successfully!'
