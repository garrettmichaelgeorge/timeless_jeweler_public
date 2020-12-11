require_relative 'application_seeder'

class Seeders
  class DiamondClaritySeeder < ApplicationSeeder
    GRADES = %w[
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
      GRADES.each do |grade|
        DiamondClarity.create!(
          grade: grade
        )
      end
    end
  end
end
