class Seeders
  class ApplicationSeeder
    # Abstract class: do not call directly

    def self.execute
      log
      new.execute
    end

    def self.log
      puts "-- Seeding #{seed_target}"
    end

    def self.seed_target
      to_s.demodulize.gsub('Seeder', '')
    end

    def execute
      raise NotImplementedError
    end
  end
end
