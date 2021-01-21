class Seeders
  class ApplicationSeeder
    # Abstract class: do not call directly

    def self.execute
      return unless safe_for_production? || Rails.env.development?

      log
      new.execute
    end

    def self.log
      puts "-- Seeding #{seeder_target}"
    end

    def self.seeder_target
      to_s.demodulize.gsub('Seeder', '')
    end

    # subclasses may override
    def self.safe_for_production?
      false
    end

    def execute
      raise NotImplementedError
    end

    private

    # helper method for creating records in lookup tables
    # Example usage: NAMES.each { |name| seed_with_value(name: name) }
    def seed_with_value(record_class = seeder_target, **attrs)
      record_class.create_or_find_by(**attrs)
    end
  end
end
