# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id                    :bigint           not null, primary key
#  birthday              :date
#  first_name            :string(40)
#  last_name             :string(40)
#  necklace_length       :decimal(4, 2)
#  necklace_length_notes :text
#  ring_size             :decimal(4, 2)
#  ring_size_notes       :text
#  suffix                :string(20)
#  title                 :string(20)
#  household_id          :bigint
#
# Indexes
#
#  index_people_on_household_id  (household_id)
#
# Foreign Keys
#
#  fk_rails_...  (household_id => households.id)
#
class Person < ApplicationRecord
  acts_as :party

  scope :contact_info, -> { includes(:addresses, :email_addresses, :phone_numbers) }

  belongs_to :household, optional: true

  has_many :addresses,                    as: :addressable
  has_many :email_addresses,              as: :emailable
  has_many :phone_numbers,                as: :phoneable

  accepts_nested_attributes_for :party, allow_destroy: true
  accepts_nested_attributes_for :household, allow_destroy: true
  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :email_addresses, allow_destroy: true
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

  after_initialize do |person|
    build_party if party.nil?
  end

  validates :first_name, presence: true, length: { maximum: 40 }
  validates :last_name, length: { maximum: 40 }

  delegate  :state_province_name, to: :addresses
  delegate  :members,
            :member_ids,
            :member_names,
            to: :household,
            prefix: :household,
            allow_nil: true

  delegate  :purchase_history,
            :products,
            :product_ids,
            :product_names,
            :store_transactions,
            :store_transaction_datetime,
            to: :party,
            allow_nil: true

  def self.purchase_history
    Party.purchase_history
  end

  def create_household_from_last_name!
    # Create an associated household using the person's last name as
    # the household name unless the person already has a household
    return household if household

    create_household!(household_name: self.last_name)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

  # Provide full name when party.specific.name is called.
  # This allows us to call #name method on party#specific without knowing the actable_type 
  alias name full_name

  def household_name
    self.household.household_name if self.household_id?
  end
end
