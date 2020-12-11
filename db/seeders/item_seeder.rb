require_relative 'application_seeder'

class Seeders
  class ItemSeeder < ApplicationSeeder
    SEED_COUNT = 750

    def execute
      seed
    end

    def seed
      SEED_COUNT.times do
        name             = Faker::Commerce.product_name
        description      = Faker::Lorem.sentence
        cost             = Money.new(rand(10..100_000), 'USD')
        price            = calculate_profit_from(cost)
        product_style_id = rand(1..::ItemStyle.count)

        ::Item.create!(name: name,
                       description: description,
                       cost: cost,
                       price: price,
                       product_style_id: product_style_id)
      end
    end

    private

    def calculate_profit_from(cost)
      cost * rand(11.0..17.0) / 10.0
    end
  end
end
