require_relative 'application_seeder'

class Seeders
  class ItemSourceSeeder < ApplicationSeeder
    CODES = %w[E B T].freeze

    def execute
      puts '-- Source: seeding'

      CODES.each do |code|
        ::Source.create!(code: code)
      end
    end
  end
end
