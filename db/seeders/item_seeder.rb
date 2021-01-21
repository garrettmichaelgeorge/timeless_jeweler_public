require_relative 'application_seeder'

class Seeders
  class ItemSeeder < ApplicationSeeder
    SEED_COUNT = 750

    def execute
      seed_items
    end

    private

    def seed_items
      SEED_COUNT.times do
        seed_item
      end
    end

    def seed_item
      user_items.create_or_find_by(name: name,
                                   description: description,
                                   category: category,
                                   cost: cost,
                                   price: price,
                                   item_style_id: item_style_id)
    end

    def user_items(user: ::User.first)
      user.items
    end

    def item_style_id
      rand(1..::ItemStyle.count)
    end

    def price
      simulate_profit_margin_from(cost)
    end

    def cost
      Money.new(rand(10..100_000), 'USD')
    end

    def category
      %w[Piece LooseGemstone MiscellaneousItem].sample
    end

    def description
      Faker::Lorem.sentence
    end

    def name
      Faker::Commerce.product_name
    end

    def simulate_profit_margin_from(cost)
      cost * rand(11.0..17.0) / 10.0
    end
  end
end
