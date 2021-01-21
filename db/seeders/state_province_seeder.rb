require_relative 'application_seeder'

class Seeders
  class StateProvinceSeeder < ApplicationSeeder
    STATE_CODES = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD
                     MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC
                     SD TN TX UT VT VA WA WV WI WY].freeze
    STATE_NAMES = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California',
                   'Colorado', 'Connecticut', 'Delaware', 'Florida', 'Georgia',
                   'Hawaii', 'Idaho', 'Illinois', 'Indiana', 'Iowa', 'Kansas',
                   'Kentucky', 'Louisiana', 'Maine', 'Maryland',
                   'Massachusetts', 'Michigan', 'Minnesota', 'Mississippi',
                   'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire',
                   'New Jersey', 'New Mexico', 'New York', 'North Carolina',
                   'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania',
                   'Rhode Island', 'South Carolina', 'South Dakota',
                   'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia',
                   'Washington', 'West Virginia', 'Wisconsin', 'Wyoming'].freeze
    STATE_DATA = Hash[STATE_CODES.zip(STATE_NAMES)].freeze

    def execute
      STATE_DATA.each do |code, name|
        seed_with_value(code: code, name: name)
      end
    end

    def self.safe_for_production?
      true
    end
  end
end
