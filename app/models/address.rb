# == Schema Information
#
# Table name: addresses
#
#  id              :bigint           not null, primary key
#  address_line_1  :string(80)
#  address_line_2  :string(80)
#  city            :string(30)
#  country_region  :string(2)
#  state_province  :string(2)
#  zip_postal_code :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Address < ApplicationRecord

  before_validation :upcase_state_province

  private

  # Converts state_province to all uppercase
  def upcase_state_province
    puts 'Upcasing address.state_province'
    self.state_province = state_province.upcase
  end

end
