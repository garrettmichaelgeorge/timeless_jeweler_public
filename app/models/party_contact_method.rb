class PartyContactMethod < ApplicationRecord
  belongs_to :party
  has_one :address
  has_one :phone_number
  has_one :email_address
end
