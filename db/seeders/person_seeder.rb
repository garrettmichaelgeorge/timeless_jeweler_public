require_relative 'application_seeder'

class Seeders
  class PersonSeeder < ApplicationSeeder
    COUNT = 150

    def execute
      COUNT.times do
        person = create_person
        add_addresses_to(person)
        add_email_addresses_to(person)
        add_phone_numbers_to(person)
      end
    end

    private

    def create_person
      ::Person.create!(title: Faker::Name.prefix,
                       first_name: Faker::Name.first_name,
                       last_name: Faker::Name.last_name,
                       suffix: Faker::Name.suffix,
                       ring_size: rand(3.0..10.0),
                       ring_size_notes: Faker::Lorem.sentence,
                       necklace_length: rand(3.0..10.0),
                       necklace_length_notes: Faker::Lorem.sentence,
                       birthday: Faker::Date.birthday(min_age: 25, max_age: 82))
    end

    def add_phone_numbers_to(person)
      phone_number = rand(1_000_000_000..9_999_999_999).to_s
      person.phone_numbers.create!(phone_number: phone_number)
    end

    def add_email_addresses_to(person)
      person.email_addresses.create!(email_address: Faker::Internet.unique.email)
    end

    def add_addresses_to(person)
      person.addresses.create!(address_line_1: Faker::Address.street_address,
                               city: Faker::Address.city,
                               state_province_id: rand(1..50),
                               zip_postal_code: Faker::Address.zip)
    end
  end
end
