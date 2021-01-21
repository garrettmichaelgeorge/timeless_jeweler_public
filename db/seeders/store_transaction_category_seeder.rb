require_relative 'application_seeder'

class Seeders
  class StoreTransactionCategorySeeder < ApplicationSeeder
    def execute
      seed_with_value(name: 'Sales')
    end
  end
end
