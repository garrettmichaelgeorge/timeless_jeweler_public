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
require_relative 'seeders/metal_category_seeder'
require_relative 'seeders/metal_color_seeder'
require_relative 'seeders/metal_purity_seeder'

# Dir['seeds/*.rb'].each do |file|
#   puts "Processing #{file.split('/').last}"
#   require_relative file
# end

class Seeder
  SEEDERS = %w[ StateProvinceSeeder
                PersonSeeder
                HouseholdSeeder
                ItemStyleSeeder
                DiamondCutSeeder
                DiamondClaritySeeder
                DiamondColorSeeder
                MetalPuritySeeder
                MetalCategorySeeder
                MetalColorSeeder ].freeze

  def self.execute
    new.execute
  end

  def execute
    log_begin
    call_seeders
    log_success
  end

  private

  def call_seeders
    seeders.each(&:execute)
  end

  def seeders
    SEEDERS.map { |seeder| "Seeders::#{seeder}".constantize }
  end

  def log_begin
    puts '== Database: seeding'
    puts '== Seeding Tables'
  end

  def log_success
    puts '== Database: seeded!'
  end
end
