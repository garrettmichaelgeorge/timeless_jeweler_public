require_relative 'application_seeder'

class Seeders
  class MetalCategorySeeder < ApplicationSeeder
    NAMES = [
             'Aluminum',
             'Brass',
             'Bronze',
             'Copper',
             'Copper Plate',
             'Gold',
             'Iron',
             'Platinum',
             'Silver',
             'Sterling Silver',
             'Fine Silver',
             'Mexican Silver',
             'Silver Plate',
             'Steel',
             'Stainless Steel',
             'Titanium',
             'Unknown'
    ].freeze

    def execute
      NAMES.each do |name|
        seed_with_value(name: name)
      end
    end

    def self.safe_for_production?
      true
    end
  end
end
