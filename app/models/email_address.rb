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

  validates :email_address, presence: true,
                            length: { maximum: 255 },
                            email: true,
                            uniqueness: true

  def email_address=(value)
    super(format_email(value))
  end

  private

  def format_email(email)
    email&.downcase
  end
end
