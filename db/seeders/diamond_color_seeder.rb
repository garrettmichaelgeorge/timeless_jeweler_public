require_relative 'application_seeder'

class Seeders
  class DiamondColorSeeder < ApplicationSeeder
    GRADES = ('D'..'Z').to_a

    def execute
      GRADES.each do |grade|
        seed_with_value(DiamondColor, grade: grade)
      end
    end

    def self.safe_for_production?
      true
    end
  end
end
