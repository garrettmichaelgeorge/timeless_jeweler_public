# frozen_string_literal: true

require 'rails-i18n'
require_relative 'wiper'
# require_relative 'seeder'

# module Seeds
#   def self.seed_db_for(env)
#     puts '== Database: seeding'
#     Wiper.execute unless env.production?
#     Seeder.execute
#   end
# end

# Seeds.seed_db_for(Rails.env)

def lookup(value)
  I18n.t(value, scope: :lookup)
end

def seed_table(lookup_key, model:)
  lookup(lookup_key).each do |value|
    model.create_or_find_by(name: value)
  end
  print '.'
end

puts '== Seeding database'

ActiveRecord::Base.transaction do |_t|
  seed_table(:item_styles, model: ItemStyle)
  seed_table(:gemstone_categories, model: Gemstone::Category)
  seed_table(:diamond_clarities, model: Diamond::Clarity)
  seed_table(:diamond_cuts, model: Diamond::Cut)
  seed_table(:diamond_colors, model: Diamond::Color)
  seed_table(:metal_categories, model: MetalCategory)
  seed_table(:metal_colors, model: MetalColor)
  seed_table(:metal_purities, model: MetalPurity)
  seed_table(:state_provinces, model: StateProvince)
end

puts "\n== Database seeded!"
