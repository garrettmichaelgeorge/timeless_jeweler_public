require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  def setup
    @product = products(:rolex)
    @user = users(:bob)

    sign_in @user
  end

  test 'should get index' do
    get products_path
    assert_response :success
  end

  test 'should get show' do
    get products_path(@product)
    assert_response :success
  end

  test 'should get new' do
    get new_product_path
    assert_response :success
  end

  test 'should get edit' do
    get edit_product_path(@product)
    assert_response :success
  end

  test 'should redirect to Product#show and display flash after successful #new' do
    # FIXME: mock successful POST request to controller
    # post products_path
    # assert_redirected_to products_path(Product.last)
    # assert_equal 'Product was successfully created.', flash[:notice]
  end
end
