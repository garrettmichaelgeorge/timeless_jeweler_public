# == Schema Information
#
# Table name: addresses
#
#  id                :bigint           not null, primary key
#  address_line_1    :string(80)
#  address_line_2    :string(80)
#  addressable_type  :string           not null
#  city              :string(30)
#  country_region    :string(2)
#  zip_postal_code   :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  addressable_id    :bigint           not null
#  state_province_id :bigint           not null
#
# Indexes
#
#  index_addresses_on_addressable_type_and_addressable_id  (addressable_type,addressable_id)
#  index_addresses_on_state_province_id                    (state_province_id)
#
# Foreign Keys
#
#  fk_rails_...  (state_province_id => state_provinces.id)
#
require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @address = Address.new(address_line_1: '50 Market St.',
                           city: 'San Francisco',
                           state_province: 'CA',
                           zip_postal_code: '94111')
  end
end
