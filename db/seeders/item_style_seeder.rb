require_relative 'application_seeder'

class Seeders
  class ItemStyleSeeder < ApplicationSeeder
    NAMES = [
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

    def execute
      NAMES.each { |name| seed_with_name(name) }
    end

    private

    def seed_with_name(name)
      ::ItemStyle.create!(name: name)
    end
  end
end
