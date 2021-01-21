require_relative 'application_seeder'

class Seeders
  class MetalColorSeeder < ApplicationSeeder
    NAMES = %w[White Yellow Rose].freeze

    def execute
      NAMES.each { |name| seed_with_name(name) }
    end

    def self.safe_for_production?
      true
    end

    private

    def seed_with_name(name)
      ::MetalColor.create! name: name
    end
  end
end
