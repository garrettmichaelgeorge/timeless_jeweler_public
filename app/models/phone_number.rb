# == Schema Information
#
# Table name: phone_numbers
#
#  id             :bigint           not null, primary key
#  phone_number   :string(32)
#  phoneable_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  phoneable_id   :bigint           not null
#
# Indexes
#
#  index_phone_numbers_on_phoneable_type_and_phoneable_id  (phoneable_type,phoneable_id)
#
class PhoneNumber < ApplicationRecord
  belongs_to :phoneable, polymorphic: true
end
