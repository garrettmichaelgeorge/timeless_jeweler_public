require_relative 'application_seeder'

class Seeders
  class DiamondColorSeeder < ApplicationSeeder
    GRADES = ('D'..'Z').to_a.freeze

    def execute
      GRADES.each { |grade| seed_with_value(grade: grade) }
    end

    class << self
      def safe_for_production?
        true
      end

      def seeder_target
        Diamond::Color
      end
    end
  end
end
