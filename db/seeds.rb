# frozen_string_literal: true

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

puts '-- Address.destroy_all'
Address.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(Address.table_name)

puts '-- StateProvince.destroy_all'
StateProvince.destroy_all
ActiveRecord::Base.connection.reset_pk_sequence!(StateProvince.table_name)

# ========================================================================
# === Seed Database
# ========================================================================

puts '-- StateProvinces: creating'
puts ''

STATE_ABBRS = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY].freeze
STATE_NAMES = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'].freeze

states = Hash[STATE_ABBRS.zip(STATE_NAMES)]
states.each do |abbr, name|
  StateProvince.create!(
    code: abbr,
    name: name
  )
end

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
  necklace_length: 8.0,
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
puts '-- People with Addresses, Email Addresses, Phone Numbers: creating'
puts ''

150.times do |_n|
  title                 = Faker::Name.prefix
  first_name            = Faker::Name.first_name
  last_name             = Faker::Name.last_name
  suffix                = Faker::Name.suffix
  ring_size             = rand(3.0..10.0)
  ring_size_notes       = Faker::Movies::StarWars.quote
  necklace_length       = rand(3.0..10.0)
  necklace_length_notes = Faker::Movies::StarWars.quote
  birthday              = Faker::Date.birthday(min_age: 25, max_age: 82)
  # Address
  address_line_1        = Faker::Address.street_address
  city                  = Faker::Address.city
  state_province_id     = rand(1..50)
  zip_postal_code       = Faker::Address.zip
  # Phone Number
  email_address         = Faker::Internet.unique.email
  # Phone Number
  phone_number          = rand(1111111111..9999999999).to_s

  person = Person.create!(
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
  person.addresses.create!(
    address_line_1: address_line_1,
    city: city,
    state_province_id: state_province_id,
    zip_postal_code: zip_postal_code
  )
  person.email_addresses.create!(
    email_address: email_address
  )
  person.phone_numbers.create!(
    phone_number: phone_number
  )
end

# Create households
puts '-- Households: creating'
puts ''

Person.first(20).each do |person|
  person.create_household!
  Household.create!(
    household_name: 
  )
end

puts '-- Products: creating'
puts ''

750.times do |_n|
  name                  = Faker::Commerce.product_name
  description           = Faker::Movies::StarWars.quote
  brand                 = Faker::Lorem.word.capitalize
  size                  = rand(2.0..11.0)
  size_unit             = 'in'
  weight                = rand(2.0..11.0)
  weight_unit           = 'oz'
  misc_measurements     = nil
  cost                  = Faker::Commerce.price(range: 0.99..50_000.00)
  price                 = Faker::Commerce.price(range: 0.99..50_000.00)
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

100.times do |_n|
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

250.times do |_n|
  quantity              = rand(1..10)
  price_cents           = Money.new(rand(1000..10_000_000), 'USD')
  tax_cents             = 0
  store_transaction_id  = rand(StoreTransaction.first.id..StoreTransaction.last.id)
  product_id            = rand(Product.first.id..Product.last.id)

  StoreTransactionLineItem.create!(
    quantity: quantity,
    price_cents: price_cents,
    tax_cents: tax_cents,
    store_transaction_id: store_transaction_id,
    product_id: product_id
  )
end


puts '== Database: seeded'
puts ''
