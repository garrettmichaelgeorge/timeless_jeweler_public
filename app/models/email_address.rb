# == Schema Information
#
# Table name: email_addresses
#
#  id            :bigint           not null, primary key
#  email_address :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
class EmailAddress < ApplicationRecord
  before_save :downcase_email

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true

  private

  def downcase_email
    self.email = email.downcase
  end
end
