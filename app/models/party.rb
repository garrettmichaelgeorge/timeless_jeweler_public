class Party < ApplicationRecord
  actable

  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :email_addresses
  has_and_belongs_to_many :phone_numbers

  before_validation do |party|
  end

end