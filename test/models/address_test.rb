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
require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  def setup
    @address = Address.new(address_line_1: '50 Market St.',
                           city: 'San Francisco',
                           state_province: 'CA',
                           zip_postal_code: '94111')
  end

  test "state_province should be upcased before save" do
    @address.state_province = 'ca'
    @address.save
    assert_equal 'ca'.upcase, @address.state_province
  end
end
