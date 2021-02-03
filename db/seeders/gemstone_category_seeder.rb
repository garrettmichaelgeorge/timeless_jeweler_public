require_relative 'application_seeder'

class Seeders
  class GemstoneCategorySeeder < ApplicationSeeder
    NAMES = ['Agate',
             'Alexandrite',
             'Amazonite',
             'Amber',
             'Amethyst',
             'Aquamarine',
             'Beryl',
             'Carnelian',
             'Chalcedony',
             'Chrysoberyl',
             'Chrysoprase',
             'Citrine',
             'Coral',
             'Crystal',
             'Diamond',
             'Black Diamond',
             'Blue Diamond',
             'Brown Diamond',
             'Pink Diamond',
             'White Diamond',
             'Yellow Diamond',
             'Emerald',
             'Garnet',
             'Hematite',
             'Iolite',
             'Jade',
             'Kunzite',
             'Labradorite',
             'Lapis Lazuli',
             'Malachite',
             'Marcasite',
             'Moonstone',
             'Morganite',
             'Multi-gemstone',
             'Onyx',
             'Opal',
             'Pearl',
             'Black Pearl',
             'Cultured Pearl',
             'Freshwater Pearl',
             'Natural Pearl',
             'Saltwater Pearl',
             'Seed Pearl',
             'South Sea Pearl',
             'Peridot',
             'Quartz',
             'Rhinestone',
             'Rock Crystal',
             'Rubellite',
             'Ruby',
             'Sapphire',
             'Blue Sapphire',
             'Green Sapphire',
             'Pink Sapphire',
             'Star Sapphire',
             'Yellow Sapphire',
             'Spinel',
             'Tanzanite',
             "Tiger's Eye",
             'Topaz',
             'Tourmaline',
             'Tsavorite',
             'Turquoise',
             'Turquoise Matrix',
             'Zircon',
             'Chrysophrase',
             'Rubelite'].freeze

    def execute
      NAMES.each { |value| seed_with_value(seeder_target.constantize, name: value) }
    end

    class << self
      def safe_for_production?
        true
      end

      def seeder_target
        'Gemstone::Category'
      end
    end
  end
end
