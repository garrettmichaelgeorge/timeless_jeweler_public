puts '== Processing files'
Dir[Rails.root.join('db/seeders/*.rb')].each do |file|
  puts "-- Processing #{file.split('/').last}"
  require_relative file
end
puts ''

class Seeder
  SEEDERS = %w[ UserSeeder
                StateProvinceSeeder
                PersonSeeder
                HouseholdSeeder
                ItemStyleSeeder
                GemstoneCategorySeeder
                DiamondCutSeeder
                DiamondClaritySeeder
                DiamondColorSeeder
                MetalPuritySeeder
                MetalCategorySeeder
                MetalColorSeeder
                ItemSeeder ].freeze

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
    SEEDERS.map { |seeder| constantize_seeder(seeder) }
  end

  def constantize_seeder(seeder)
    "Seeders::#{seeder}".constantize
  end

  def log(string)
    puts string
  end

  def log_begin
    log "== Database: seeding\n" \
        '== Seeding Tables'
  end

  def log_success
    log '== Database: seeded!'
  end
end
