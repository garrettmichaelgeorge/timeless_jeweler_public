require_relative 'application_seeder'

class Seeders
  class DiamondCutSeeder < ApplicationSeeder
    GRADES = ['Excellent',
              'Very Good',
              'Good',
              'Fair',
              'Poor'].freeze

    def execute
      GRADES.each { |grade| seed_with_value(Diamond::Cut, grade: grade) }
    end

    class << self
      def safe_for_production?
        true
      end

      def seeder_target
        Diamond::Cut
      end
    end
  end
end
