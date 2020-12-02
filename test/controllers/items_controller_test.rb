require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup; end

  test 'should get index' do
    get items_path
    assert_response :success
  end

  test 'should get show' do
    get items_path(@item)
    assert_response :success
  end

  test 'should get new' do
    get new_item_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_item_path(@item)
    assert_response :success
  end

  test 'should redirect to Items#show and display flash after successful #new' do
    # FIXME: mock successful POST request to controller
    # post items_path
    # assert_redirected_to items_path(Item.last)
    # assert_equal 'Item was successfully created.', flash[:notice]
  end

  context 'flash' do
  end
end
