require 'test_helper'

class PeopleIndexTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = users(:bob)
    sign_in @user
  end

  test "index people" do
    get people_url
    assert_response :success
    assert_template :index
    assert_select 'h1', 'Customers'
    assert_select 'table'
  end
end

