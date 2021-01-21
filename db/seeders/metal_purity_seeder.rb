require_relative 'application_seeder'

class Seeders
  class MetalPuritySeeder < ApplicationSeeder
    VALUES = %w[ 9K
                 10K
                 14K
                 18K
                 22K
                 0.800
                 0.900
                 0.925
                 0.950
                 0.999
                 GF
                 Unknown ].freeze

    def execute
      VALUES.each do |value|
        seed_with_value(value: value)
      end
    end

    def self.safe_for_production?
      true
    end
  end
end
