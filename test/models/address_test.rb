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
