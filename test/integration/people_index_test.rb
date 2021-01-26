require 'test_helper'

class PeopleIndexTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @user = FactoryBot.build(:user)
    sign_in @user
  end

  test 'index people' do
    visit people_path
    assert_response :success
    assert_template :index
    assert_selector 'h1', text: 'Customers'
    assert_selector 'table'
  end
end
