require_relative 'seeders/state_province_seeder'
require_relative 'seeders/person_seeder'
require_relative 'seeders/household_seeder'
require_relative 'seeders/item_style_seeder'
require_relative 'seeders/diamond_cut_seeder'
require_relative 'seeders/diamond_clarity_seeder'
require_relative 'seeders/diamond_color_seeder'
require_relative 'seeders/item_seeder'
require_relative 'seeders/store_transaction_category_seeder'
require_relative 'seeders/store_transaction_seeder'

class SeedDirector
  SEEDERS = %w[StateProvinceSeeder
               PersonSeeder
               HouseholdSeeder
               ItemStyleSeeder
               DiamondCutSeeder
               DiamondClaritySeeder
               DiamondColorSeeder].freeze

  def self.execute
    log_begin
    new.execute
    log_success
  end

  def execute
    call_seeders
  end

  private

  def call_seeders
    constants_for(SEEDERS).each(&:execute)
  end

  def constants_for(seeders)
    seeders.map { |seeder| "Seeders::#{seeder}".constantize }
  end

  def self.log_begin
    puts '== Database: seeding'
    puts '== Seeding Tables'
  end

  def self.log_success
    puts '== Database: seeded!'
  end
end
