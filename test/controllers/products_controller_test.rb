require 'test_helper'

class ProductsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @product = products(:one)
  end

  test "should get index" do
    get products_url
    assert_response :success
  end

  test "should get new" do
    get new_product_url
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      post products_url, params: { product: { clarity: @product.clarity, color: @product.color, cost: @product.cost, customer_id: @product.customer_id, date_sold: @product.date_sold, length: @product.length, metal: @product.metal, miscellaneous_measurements: @product.miscellaneous_measurements, narrative_description: @product.narrative_description, notes: @product.notes, purity: @product.purity, report_number: @product.report_number, retail_price: @product.retail_price, size: @product.size, source: @product.source, weight: @product.weight } }
    end

    assert_redirected_to product_url(Product.last)
  end

  test "should show product" do
    get product_url(@product)
    assert_response :success
  end

  test "should get edit" do
    get edit_product_url(@product)
    assert_response :success
  end

  test "should update product" do
    patch product_url(@product), params: { product: { clarity: @product.clarity, color: @product.color, cost: @product.cost, customer_id: @product.customer_id, date_sold: @product.date_sold, length: @product.length, metal: @product.metal, miscellaneous_measurements: @product.miscellaneous_measurements, narrative_description: @product.narrative_description, notes: @product.notes, purity: @product.purity, report_number: @product.report_number, retail_price: @product.retail_price, size: @product.size, source: @product.source, weight: @product.weight } }
    assert_redirected_to product_url(@product)
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete product_url(@product)
    end

    assert_redirected_to products_url
  end
end
