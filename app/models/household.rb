class Household < ApplicationRecord
  validates :household_name, presence: true

  has_many :customers
end
