require_relative 'application_seeder'

class Seeders
  class DiamondCutSeeder < ApplicationSeeder
    GRADES = ['Excellent',
              'Very Good',
              'Good',
              'Fair',
              'Poor'].freeze

    def execute
      GRADES.each do |grade|
        ::DiamondCut.create!(grade: grade)
      end
    end

    def self.safe_for_production?
      true
    end
  end
end