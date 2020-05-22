class Party < ApplicationRecord
  actable


  has_one :party_contact_method, dependent: :destroy
  has_one :address, through: :party_contact_method, dependent: :destroy
  has_one :phone_number, through: :party_contact_method, dependent: :destroy
  has_one :email_address, through: :party_contact_method, dependent: :destroy

  before_validation do |party|
    @party_contact_method = party.build_party_contact_method
  end

  validates :party_contact_method, presence: :true


end