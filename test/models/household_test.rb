require 'test_helper'

class HouseholdTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
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
