# == Schema Information
#
# Table name: households
#
#  id                 :bigint           not null, primary key
#  addresses_type     :string
#  anniversary        :date
#  email_address_type :string
#  household_name     :string(40)
#  phone_numbers_type :string
#  addresses_id       :bigint
#  email_address_id   :bigint
#  phone_numbers_id   :bigint
#
# Indexes
#
#  index_households_on_addresses_type_and_addresses_id          (addresses_type,addresses_id)
#  index_households_on_email_address_type_and_email_address_id  (email_address_type,email_address_id)
#  index_households_on_phone_numbers_type_and_phone_numbers_id  (phone_numbers_type,phone_numbers_id)
#
require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  def setup
    @household = Household.new(household_name: "Schumann",
                               anniversary: "1840-01-01")
  end
  
  test "should be valid" do
    assert @household.valid?
  end

  test "household name should be present" do
    @household.household_name = ""
    assert_not @household.valid?
  end

  test "household name should not be too long" do
    @household.household_name = "a" * 41
    assert_not @household.valid?
  end

  test "should act as party" do
    assert_equal Party, @household.acting_as.class
  end
  
  test "should have a corresponding party id on save" do
    @household.save
    assert @household.acting_as.id
  end

  test "should be equal to the subtype of its supertype (i.e. parties)" do
    @household.save
    assert_equal @household, @household.acting_as.specific
  end
end
