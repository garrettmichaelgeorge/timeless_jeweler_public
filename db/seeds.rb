# frozen_string_literal: true

require_relative 'wiper'
require_relative 'seeder'

module Seeds
  def self.seed_db_for(env)
    puts '== Database: seeding'

    Wiper.execute unless env.production?
    Seeder.execute
  end
end

Seeds.seed_db_for(Rails.env)
