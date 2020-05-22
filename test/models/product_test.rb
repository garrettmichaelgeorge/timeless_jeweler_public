require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:rolex)
  end

  test 'should create new product' do
    @product = Product.new
    assert @product.save!
  end

  test 'should be valid' do
    assert @product.valid?
  end

end
