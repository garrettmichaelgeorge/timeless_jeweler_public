# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Person.create!(title: "Mrs.",
               first_name: "Clara",
               last_name: "Schumann",
               suffix: nil,
               ring_size: 33.5,
               ring_size_notes: "Will need to resize next visit",
               necklace_length: 40,
               necklace_length_notes: "Prefers very lightweight necklaces. Too short better than too long.")

99.times do |n|
  first_name = Faker::Name.name
  last_name  = Faker::Name.name
  ring_size  = rand(30.0..40.0)
  necklace_length  = rand(30.0..40.0)
  Person.create!(first_name: first_name,
                last_name: last_name,
                ring_size: ring_size,
                necklace_length: necklace_length)
end