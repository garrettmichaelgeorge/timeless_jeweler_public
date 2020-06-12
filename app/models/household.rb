# == Schema Information
#
# Table name: households
#
#  id                 :bigint           not null, primary key
#  addresses_type     :string
#  anniversary        :date
#  email_address_type :string
#  household_name     :string(40)
#  phone_numbers_type :string
#  addresses_id       :bigint
#  email_address_id   :bigint
#  phone_numbers_id   :bigint
#
# Indexes
#
#  index_households_on_addresses_type_and_addresses_id          (addresses_type,addresses_id)
#  index_households_on_email_address_type_and_email_address_id  (email_address_type,email_address_id)
#  index_households_on_phone_numbers_type_and_phone_numbers_id  (phone_numbers_type,phone_numbers_id)
#
class Household < ApplicationRecord
  acts_as :party
  has_many :people
  
  # after_initialize do
  #   self.build_party if party.nil?
  # end

  validates :household_name, presence: true, length: { maximum: 40 }

  # FIXME: move this view logic into a helper
  # (better: label households with an icon instead of an added word)
  # Provide household name when party.specific.name is called.
  # This allows us to use the same method on party.specific without knowing the actable_type.
  def name
    "#{self.household_name} (Household)"
  end

  def members
    self.people
  end

  def member_ids
    self.person_ids
  end

  def member_names
    self.people.each do |member|
      member.full_name
    end
  end
end
