# frozen_string_literal: true

require_relative 'wiper'
require_relative 'seed_director'

puts '== Database: seeding'

Wiper.execute
SeedDirector.execute
