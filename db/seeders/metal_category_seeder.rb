require_relative 'application_seeder'

class Seeders
  class MetalCategorySeeder < ApplicationSeeder
    NAMES = ['Aluminum',
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
             'Unknown'].freeze

    def execute
      NAMES.each { |name| seed_with_name(name) }
    end

    private

    def seed_with_name(name)
      ::MetalCategory.create!(name: name)
    end
  end
end
