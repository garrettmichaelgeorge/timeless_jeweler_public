# frozen_string_literal: true

class Person < ApplicationRecord
  acts_as :party
  belongs_to :household, optional: true

  accepts_nested_attributes_for :party, allow_destroy: true
  accepts_nested_attributes_for :household, allow_destroy: true
  accepts_nested_attributes_for :address, allow_destroy: true
  accepts_nested_attributes_for :email_address, allow_destroy: true
  accepts_nested_attributes_for :phone_number, allow_destroy: true

  after_initialize do |person|
    @last_name = person.last_name
    build_party if party.nil?
  end

  validates :first_name, presence: true, length: { maximum: 40 }
  validates :last_name, length: { maximum: 40 }

  def create_household_from_last_name!
    # Create an associated household using the person's last name as
    # the household name unless the person already has a household
    create_household!(household_name: @last_name) unless household
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
