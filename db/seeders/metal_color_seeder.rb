require_relative 'application_seeder'

class Seeders
  class MetalColorSeeder < ApplicationSeeder
    NAMES = %w[White Yellow Rose].freeze

    def execute
      NAMES.each do |name|
        seed_with_value(name: name)
      end
    end

    def self.safe_for_production?
      true
    end
  end
end
