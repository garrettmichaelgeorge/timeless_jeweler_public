require 'test_helper'

class PartiesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @party       = parties(:clara)
    @other_party = parties(:robert)
  end

  test "should get index" do
    get parties_path
    assert_response :success
  end
  
  test "should get show" do
    get party_path(@party)
    assert_response :success
  end
  
  test "should get new" do
    get new_party_path
    assert_response :success
  end

  test "should get edit" do
    get edit_party_path(@party)
    assert_response :success
  end

end
