require_relative 'application_seeder'

class Seeders
  class ItemSourceSeeder < ApplicationSeeder
    CODES = %w[E B T].freeze

    def execute
      CODES.each do |code|
        seed_with_value(code: code)
      end
    end
  end
end
