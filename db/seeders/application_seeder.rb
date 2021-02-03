class Seeders
  class ApplicationSeeder
    # Abstract class: do not call directly

    def execute
      raise NotImplementedError
    end

    def log
      puts "-- Seeding #{seeder_target}"
    end

    def seeder_target
      self.class.seeder_target
    end

    class << self
      def execute
        return unless executable?

        seeder = new
        seeder.log
        seeder.execute
      end

      def executable?
        safe_for_production? || Rails.env.development?
      end

      # subclasses may override
      def safe_for_production?
        false
      end

      def seeder_target
        # Assumes the naming convention: 'Seeders::ModelClassSeeder' seeds 'ModelClass'
        to_s.demodulize.gsub('Seeder', '').constantize
      end
    end

    private

    # helper method for creating records in lookup tables
    # Example usage: NAMES.each { |name| seed_with_value(name: name) }
    def seed_with_value(record_class = seeder_target, **attrs)
      record_class.create_or_find_by(**attrs)
    end
  end
end
