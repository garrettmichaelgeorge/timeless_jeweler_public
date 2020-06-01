# == Schema Information
#
# Table name: households
#
#  id             :bigint           not null, primary key
#  anniversary    :date
#  household_name :string(40)
#
class Household < ApplicationRecord
  acts_as :party
  has_many :people
  
  # after_initialize do
  #   self.build_party if party.nil?
  # end

  validates :household_name, presence: true, length: { maximum: 40 }

  # Provide household name when party.specific.name is called.
  # This allows us to use the same method on party.specific without knowing the actable_type.
  def name
    "#{self.household_name} (Household)"
  end
end
