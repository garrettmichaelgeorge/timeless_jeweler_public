require_relative 'application_seeder'

class Seeders
  class DiamondColorSeeder < ApplicationSeeder
    GRADES = ('D'..'Z').to_a

    def execute
      GRADES.each do |grade|
        DiamondColor.create!(grade: grade)
      end
    end
  end
end
