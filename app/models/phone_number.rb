# == Schema Information
#
# Table name: phone_numbers
#
#  id                    :bigint           not null, primary key
#  phone_number_complete :string(32)
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#
class PhoneNumber < ApplicationRecord
end
