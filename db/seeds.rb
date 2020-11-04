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
# Make sure tables with foreign keys are BEFORE the tables they reference

puts '== Wiping Tables'

tables = [
  StoreTransactionLineItem,
  StoreTransaction,
  StoreTransactionCategory,
  Person,
  Household,
  Party,
  Product,
  DiamondCut,
  DiamondClarity,
  DiamondColor,
  Product::Style,
  Product::Category,
  Address,
  StateProvince,
  EmailAddress,
  PhoneNumber
]

tables.each do |t|
  puts "-- #{t}.destroy_all"
  t.destroy_all
  ActiveRecord::Base.connection.reset_pk_sequence!(t.table_name)
end

puts ''

# ========================================================================
# === Seed Database
# ========================================================================

puts '== Seeding Tables'
puts '-- StateProvince: seeding'

STATE_CODES = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY].freeze
STATE_NAMES = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'].freeze

states = Hash[STATE_CODES.zip(STATE_NAMES)]
states.each do |code, name|
  StateProvince.create!(
    code: code,
    name: name
  )
end

# Hardcode specific customer records
puts '-- robert and clara: seeding'

clara = Person.create!(
  title: 'Mrs.',
  first_name: 'Clara',
  last_name: 'Schumann',
  suffix: nil,
  ring_size: 6.0,
  ring_size_notes: 'Will need to resize next visit',
  necklace_length: 8.0,
  necklace_length_notes: 'Prefers very lightweight necklaces. Too short better than too long.'
)

robert = Person.create!(
  title: 'Mr.',
  first_name: 'Robert',
  last_name: 'Schumann',
  suffix: nil,
  ring_size: 8.0,
  ring_size_notes: '',
  necklace_length: nil,
  necklace_length_notes: ''
)

schumann = clara.create_household!(
  household_name: 'Schumann',
  anniversary: '1840-09-12'
)

schumann.people << robert

# Create people
puts '-- Person with Address, Email Address, Phone Number: seeding'

150.times do |_n|
  title                 = Faker::Name.prefix
  first_name            = Faker::Name.first_name
  last_name             = Faker::Name.last_name
  suffix                = Faker::Name.suffix
  ring_size             = rand(3.0..10.0)
  ring_size_notes       = Faker::Lorem.sentence
  necklace_length       = rand(3.0..10.0)
  necklace_length_notes = Faker::Lorem.sentence
  birthday              = Faker::Date.birthday(min_age: 25, max_age: 82)

  # Address
  address_line_1        = Faker::Address.street_address
  city                  = Faker::Address.city
  state_province_id     = rand(1..50)
  zip_postal_code       = Faker::Address.zip

  # Email Address
  email_address = Faker::Internet.unique.email

  # Phone Number
  phone_number = rand(1_111_111_111..9_999_999_999).to_s

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
puts '-- Household: seeding'

Person.last(20).each do |person|
  person.create_household_from_last_name!
end

puts '-- Product::Category: seeding'

PRODUCT_CATEGORIES = [
  'ring',
  'brooch/pin',
  'necklace',
  'earrings',
  'bracelet',
  'pendant/locket',
  'charm',
  'cufflink',
  'jewelry set/parune',
  'watch'
].freeze

PRODUCT_CATEGORIES.each do |category|
  Product::Category.create!(
    name: category
  )
end

puts '-- Product::Style: seeding'

PRODUCT_STYLES = [
  '21st Century',
  'Art Deco',
  'Art Nouveau',
  'Arts and Crafts',
  'Baroque',
  'Belle Époque',
  'Cameo',
  'Edwardian',
  'Egyptian Revival',
  'Ethnic, Tribal',
  'Etruscan Revival',
  'Georgian',
  'Gothic Revival',
  'Greek Revival',
  'Holiday',
  'Late 20th Century',
  'Medieval',
  'Micro-mosaic',
  'Mid-Century',
  'Modernist',
  'Mourning',
  'Native American',
  'OOAK One-of-a-Kind',
  'Renaissance Revival',
  'Retro',
  'Revival',
  'Russian Empire',
  'Russian Revival',
  'Victorian',
  'Victorian Revival',
  'Wedding & Bridal',
  'Aesthetic Movement',
  'American Classical',
  'American Expressionism',
  'Ancient',
  'Chinese Export',
  'Chinoiserie',
  'Dutch, Flemish',
  'Edo',
  'Empire',
  'Ethnic Art',
  'Handcrafted',
  'Ming',
  'Modernism',
  'Napoleon I',
  'Portrait',
  'Pre-Columbian',
  'Primitive',
  'Qing',
  'Romantic',
  'Romanticism',
  'Scandinavian Modern',
  'Streamline Moderne',
  'William IV'
].freeze

PRODUCT_STYLES.each do |style|
  Product::Style.create!(
    name: style
  )
end

puts '-- Source: seeding'

SOURCES = %w[E B T].freeze

SOURCES.each do |code|
  Source.create!(
    code: code
  )
end

puts '-- DiamondCut: seeding'

DIAMOND_CUT_GRADES = [
  'Excellent',
  'Very Good',
  'Good',
  'Fair',
  'Poor'
].freeze

DIAMOND_CUT_GRADES.each do |grade|
  DiamondCut.create!(
    grade: grade
  )
end

puts '-- DiamondClarity: seeding'

DIAMOND_CLARITY_GRADES = %w[
  I1
  I2
  I3
  SI1
  SI2
  VS1
  VS2
  VVS1
  VVS2
  IF
  FL
].freeze

DIAMOND_CLARITY_GRADES.each do |grade|
  DiamondClarity.create!(
    grade: grade
  )
end

puts '-- DiamondColor: seeding'

DIAMOND_COLOR_GRADES = ('D'..'Z').to_a

DIAMOND_COLOR_GRADES.each do |grade|
  DiamondColor.create!(
    grade: grade
  )
end

puts '-- Product: seeding'

750.times do |_n|
  name                  = Faker::Commerce.product_name
  description           = Faker::Lorem.sentence
  cost                  = Money.new(rand(10..100_000), 'USD')
  price                 = cost * rand(11.0..17.0) / 10.0 # simulate profit margins
  product_category_id   = rand(1..PRODUCT_CATEGORIES.count)
  product_style_id      = rand(1..PRODUCT_STYLES.count)

  Product.create!(
    name: name,
    description: description,
    cost: cost,
    price: price,
    product_category_id: product_category_id,
    product_style_id: product_style_id
  )
end

puts '-- StoreTransactionCategory: seeding'

StoreTransactionCategory.create!(
  name: 'sales'
)

puts '-- StoreTransaction with LineItem: seeding'

300.times do |_n|
  # Transaction attributes
  transaction_datetime            = Faker::Date.backward(days: 365)
  store_transaction_category_id   = 1
  party_id                        = rand(Party.first.id..Party.last.id)

  store_transaction = StoreTransaction.create!(
    transaction_datetime: transaction_datetime,
    store_transaction_category_id: store_transaction_category_id,
    party_id: party_id
  )

  rand(1..5).times do
    store_transaction.line_items.create!(
      quantity: rand(1..10),
      tax_cents: 0,
      discount_cents: 0,
      store_transaction_id: rand(StoreTransaction.first.id..StoreTransaction.last.id),
      product_id: rand(Product.first.id..Product.last.id)
    )
  end
end

puts '== Database: seeded!'
