require_relative 'application_seeder'

class Seeders
  class StoreTransactionCategorySeeder < ApplicationSeeder
    def execute
      ::StoreTransactionCategory.create!(name: 'Sales')
    end
  end
end
