# frozen_string_literal: true

require 'rails-i18n'
# require_relative 'wiper'

# Setup

def lookup(value)
  I18n.t(value, scope: :lookup)
end

def seed_table(lookup_key, **opts)
  model = opts.fetch(:model) { lookup_key.constantize }
  lookup_attrs = lookup(lookup_key)

  if lookup_attrs.is_a?(Hash)
    lookup_attrs.each do |code, name|
      model.create_or_find_by(code: code, name: name)
    end
  else
    lookup_attrs.each do |name|
      model.create_or_find_by(name: name)
    end
  end

  print '.'
end

# Begin

# Wiper.execute

puts '== Seeding database'

ActiveRecord::Base.transaction do
  seed_table(:item_styles, model: ItemStyle)
  seed_table(:item_ownership_statuses, model: Item::OwnershipStatus)
  seed_table(:gemstone_categories, model: Gemstone::Category)
  seed_table(:diamond_clarities, model: Diamond::Clarity)
  seed_table(:diamond_cuts, model: Diamond::Cut)
  seed_table(:diamond_colors, model: Diamond::Color)
  seed_table(:metal_categories, model: Metal::Category)
  seed_table(:metal_colors, model: Metal::Color)
  seed_table(:metal_purities, model: Metal::Purity)
  seed_table(:piece_subcategories, model: Piece::Subcategory)
  seed_table(:state_provinces, model: StateProvince)
end

puts "\n== Database seeded!"
