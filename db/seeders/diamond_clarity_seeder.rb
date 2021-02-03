require_relative 'application_seeder'

class Seeders
  class DiamondClaritySeeder < ApplicationSeeder
    VALUES = %w[
      I1
      I2
      I3
      SI1
      SI2
      VS1
      VS2
      VVS1
      VVS2
      IF
      FL
    ].freeze

    def execute
      VALUES.each { |value| seed_with_value(grade: value) }
    end

    class << self
      def safe_for_production?
        true
      end

      def seeder_target
        Diamond::Clarity
      end
    end
  end
end
