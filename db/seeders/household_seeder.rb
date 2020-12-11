require_relative 'application_seeder'

class Seeders
  class HouseholdSeeder < ApplicationSeeder
    def execute
      add_households_to_people
    end

    def add_households_to_people
      ::Person.first(20).each(&:create_household_from_last_name!)
    end
  end
end
