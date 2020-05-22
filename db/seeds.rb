# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts '== Database: seeding'

# Wipe database before adding data
# Add any tables here that will be re-seeded
Person.destroy_all
puts '-- Person.destroy_all'
Household.destroy_all
puts '-- Household.destroy_all'
Party.destroy_all
puts '-- Party.destroy_all'
Product.destroy_all
puts '-- Product.destroy_all'
puts ''

puts '-- robert and clara: creating'
puts ''

Person.create!(
  title: 'Mrs.',
  first_name: 'Clara',
  last_name: 'Schumann',
  suffix: nil,
  ring_size: 6.0,
  ring_size_notes: 'Will need to resize next visit',
  necklace_length: 40.0,
  necklace_length_notes: 'Prefers very lightweight necklaces. Too short better than too long.'
  )

Person.create!(
  title: 'Mr.',
  first_name: 'Robert',
  last_name: 'Schumann',
  suffix: nil,
  ring_size: 8.0,
  ring_size_notes: '',
  necklace_length: nil,
  necklace_length_notes: ''
  )
               
Household.create!(
  id: 1,
  household_name: 'Schumann',
  anniversary: '1840-09-12'
  )
               
clara = Person.find_by(first_name: 'Clara')
clara.household_id = 1
clara.save

robert = Person.find_by(first_name: 'Robert')
robert.household_id = 1
robert.save

puts '-- People: creating'
puts ''
               
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
  Person.create!(
    title: title,
    first_name: first_name,
    last_name: last_name,
    suffix: suffix,
    ring_size: ring_size,
    ring_size_notes: ring_size_notes,
    necklace_length: necklace_length,
    necklace_length_notes: necklace_length_notes,
    birthday: birthday
    )
end

puts '-- Households: creating'
puts ''

Person.last(10).each do |person|
  person.create_household_from_last_name!
end

puts '-- Products: creating'
puts ''

74.times do |n|
  name                  = Faker::Commerce.product_name
  description           = Faker::Lorem.sentence
  brand                 = Faker::Lorem.word
  size                  = rand(2.0..11.0)
  size_unit             = "in"
  weight                = rand(2.0..11.0)
  weight_unit           = "oz"
  misc_measurements     = nil
  cost                  = Faker::Commerce.price(range: 0.99..50000.00)
  price                 = Faker::Commerce.price(range: 0.99..50000.00)
  Product.create!(
    name: name,
    description: description,
    brand: brand,
    size: size,
    size_unit: size_unit,
    weight: weight,
    weight_unit: weight_unit,
    misc_measurements: misc_measurements,
    cost: cost,
    price: price
  )
end

puts '== Database: seeded'
puts ''
