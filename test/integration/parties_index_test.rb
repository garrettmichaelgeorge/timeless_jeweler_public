require 'test_helper'

class PartiesIndexTest < ActionDispatch::IntegrationTest
  def setup
  end

  test "index people" do
    get parties_path(actable_type: 'Person')
    # get people_path
    assert_template 'parties/index'
    assert_select 'table'
  end

  test "index households" do
    get parties_path(actable_type: 'Household')
    assert_template 'parties/index'
    assert_select 'table'
  end
end
