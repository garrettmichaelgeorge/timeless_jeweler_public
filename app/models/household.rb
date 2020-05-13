class Household < ApplicationRecord
  acts_as :party
  
  # after_initialize do
  #   self.build_party if party.nil?
  # end

  validates :household_name, presence: true, length: { maximum: 40 }
end
