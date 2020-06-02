# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts '== Database: seeding'

# ========================================================================
# === Wipe database
# ========================================================================
# Wipe database before adding data
# Add any tables here that will be re-seeded

puts '-- StoreTransactionLineItem.destroy_all'
StoreTransactionLineItem.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(StoreTransactionLineItem.table_name)

puts '-- StoreTransaction.destroy_all'
StoreTransaction.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(StoreTransaction.table_name)
puts ''

puts '-- Person.destroy_all'
Person.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Person.table_name)

puts '-- Household.destroy_all'
Household.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Household.table_name)

puts '-- Party.destroy_all'
Party.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Party.table_name)

puts '-- Product.destroy_all'
Product.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Product.table_name)



# ========================================================================
# === Seed Database
# ========================================================================

# Hardcode specific customer records
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
               
schumann = Household.create!(
  household_name: 'Schumann',
  anniversary: '1840-09-12'
)
               
clara = Person.find_by(first_name: 'Clara')
clara.household_id = schumann.id
clara.save

robert = Person.find_by(first_name: 'Robert')
robert.household_id = schumann.id
robert.save

# Create people
puts '-- People: creating'
puts ''
               
150.times do |n|
  title                  = Faker::Name.prefix
  first_name             = Faker::Name.first_name
  last_name              = Faker::Name.last_name
  suffix                 = Faker::Name.suffix
  ring_size              = rand(3.0..10.0)
  ring_size_notes        = Faker::Movies::StarWars.quote
  necklace_length        = rand(3.0..10.0)
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

# Create households
puts '-- Households: creating'
puts ''

Person.last(10).each do |person|
  person.create_household_from_last_name!
end

puts '-- Products: creating'
puts ''

750.times do |n|
  name                  = Faker::Commerce.product_name
  description           = Faker::Movies::StarWars.quote
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

puts '-- StoreTransactionCategories: creating'
puts ''

StoreTransactionCategory.create!(
  name: 'sales'
)

puts '-- StoreTransactions: creating'
puts ''

100.times do |n|
  transaction_datetime            = Faker::Date.backward(days: 300)
  store_transaction_category_id   = 1
  party_id                        = rand(Party.first.id..Party.last.id)
  
  StoreTransaction.create!(
    transaction_datetime: transaction_datetime,
    store_transaction_category_id: store_transaction_category_id,
    party_id: party_id
  )
end

puts '-- StoreTransactionLineItems: creating'
puts ''

250.times do |n|
  quantity              = rand(1..10)
  store_transaction_id  = rand(StoreTransaction.first.id..StoreTransaction.last.id)
  product_id            = rand(Product.first.id..Product.last.id)
  
  StoreTransactionLineItem.create!(
    quantity: quantity,
    store_transaction_id: store_transaction_id,
    product_id: product_id
  )
end

puts '== Database: seeded'
puts ''
