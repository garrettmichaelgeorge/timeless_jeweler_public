require_relative 'application_seeder'

class Seeders
  class UserSeeder < ApplicationSeeder
    def execute
      seed_dummy_user
    end

    # for development ONLY
    def self.safe_for_production?
      false
    end

    private

    def seed_dummy_user
      seed_with_value(::User, email: dummy_email,
                              password: dummy_password)
    end

    def dummy_email
      'garrett@example.com'
    end

    def dummy_password
      'password'
    end
  end
end
