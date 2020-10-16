# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  cost_cents          :integer          default(0), not null
#  cost_currency       :string           default("USD"), not null
#  description         :text
#  name                :string(40)       not null
#  notes               :text
#  price_cents         :integer          default(0), not null
#  price_currency      :string           default("USD"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :bigint           not null
#  product_style_id    :bigint           not null
#
# Indexes
#
#  index_products_on_product_category_id  (product_category_id)
#  index_products_on_product_style_id     (product_style_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_category_id => product_categories.id)
#  fk_rails_...  (product_style_id => product_styles.id)
#
require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  def setup
    @product = products(:rolex)
  end

  test 'should create new product' do
    @new_product = Product.new
    @new_product.name = "Long women's necklace"
    @new_product.category = ProductCategory.first
    @new_product.style = ProductStyle.first
    assert @new_product.save
  end

  test 'should not save product with null category' do
    @new_product = Product.new
    @new_product.name = "Long women's necklace"
    @new_product.style = ProductStyle.first
    assert_not @new_product.save
  end

  test 'should not save product with null style' do
    @new_product = Product.new
    @new_product.name = "Long women's necklace"
    @new_product.category = ProductCategory.first
    assert_not @new_product.save
  end

  test 'should be valid' do
    assert @product.valid?, 'Expected valid product to be valid'
  end
end
