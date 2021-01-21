require_relative 'application_seeder'

class Seeders
  class StoreTransactionSeeder < ApplicationSeeder
    SEED_COUNT = 300

    def execute
      SEED_COUNT.times do
        store_transaction = seed_store_transaction
        add_line_items_to(store_transaction)
      end
    end

    private

    def seed_store_transaction
      ::StoreTransaction.create_or_find_by(transaction_datetime: Faker::Date.backward(days: 365),
                                           store_transaction_category_id: 1,
                                           party_id: rand(Party.first.id..Party.last.id))
    end

    def add_line_items_to(store_transaction)
      rand(1..5).times do
        add_line_item_to(store_transaction)
      end
    end

    def add_line_item_to(store_transaction)
      store_transaction.line_items.create_or_find_by(quantity: rand(1..10),
                                                     tax_cents: 0,
                                                     discount_cents: 0,
                                                     store_transaction_id: rand(1..StoreTransaction.last.id),
                                                     product_id: rand(Item.first.id..Item.last.id))
    end
  end
end
