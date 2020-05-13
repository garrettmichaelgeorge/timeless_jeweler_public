class Person < ApplicationRecord
  acts_as :party

  after_initialize do
    self.build_party if party.nil?
  end
  
  validates :first_name, presence: true, length: { maximum: 40 }
  validates :last_name, length: { maximum: 40 }
end