# == Schema Information
#
# Table name: parties
#
#  id           :bigint           not null, primary key
#  actable_type :string
#  party_type   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  actable_id   :integer
#
class Party < ApplicationRecord
  actable

  has_and_belongs_to_many :addresses
  has_and_belongs_to_many :email_addresses
  has_and_belongs_to_many :phone_numbers

  accepts_nested_attributes_for :addresses, allow_destroy: true
  accepts_nested_attributes_for :email_addresses, allow_destroy: true
  accepts_nested_attributes_for :phone_numbers, allow_destroy: true

  before_validation do |party|
  end

  def name
    self.specific.name
  end
end
