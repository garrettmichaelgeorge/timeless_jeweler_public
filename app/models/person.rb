class Person < ApplicationRecord
  acts_as :party

  after_initialize do
    self.build_party if party.nil?
  end
  
end