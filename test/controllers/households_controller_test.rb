require 'test_helper'

class HouseholdsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @household = households(:schumann)
  end


  test "should get index" do
    get @households
    assert_response :success
  end

  test "should get show" do
    get household_path(@household)
    assert_response :success
  end

  test "should get new" do
    get new_household_path
    assert_response :success
  end

  test "should get edit" do
    get edit_household_path(@household.id)
    assert_response :success
  end

end
