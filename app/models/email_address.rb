# == Schema Information
#
# Table name: email_addresses
#
#  id             :bigint           not null, primary key
#  email_address  :string
#  emailable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  emailable_id   :bigint           not null
#
# Indexes
#
#  index_email_addresses_on_emailable_type_and_emailable_id  (emailable_type,emailable_id)
#

class EmailAddress < ApplicationRecord
  belongs_to :emailable, polymorphic: true
  before_validation :normalize_email

  # credit: Michael Hartl, Rails Tutorial
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze

  validates :email_address, presence: true,
                            length: { maximum: 255 },
                            format: { with: VALID_EMAIL_REGEX },
                            uniqueness: true

  private

  def normalize_email
    self.email_address = email_address.downcase
  end
end
