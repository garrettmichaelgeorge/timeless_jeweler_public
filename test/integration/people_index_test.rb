require 'test_helper'

class PeopleIndexTest < ActionDispatch::IntegrationTest
  def setup
  end

  test "index people" do
    get '/customers'
    assert_template 'people/index'
    assert_select 'h1', 'Customers'
    assert_select 'table'
  end

  test "index households" do
    get households_path
    assert_template 'households/index'
    assert_select 'h1', 'Households'
    assert_select 'table'
  end
end
