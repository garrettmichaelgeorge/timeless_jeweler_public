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
  PRODUCT_CATEGORIES = %i[jewelry_product
                          miscellaneous_product
                          gemstone_product].freeze

  def setup; end

  test 'should create new product' do
    @new_product = Product.new
    @new_product.name = "Long women's necklace"
    @new_product.category = Product::Category.first
    @new_product.style = Product::Style.first
    assert @new_product.save, 'Expected to save Product with valid attributes'
  end

  context 'associations' do
    should belong_to(:category)
    should belong_to(:style)
    should have_one(:gemstone_product)
    should have_one(:gemstone), through: :gemstone_product
    should have_one(:miscellaneous_product)
    should have_one(:jewelry_product)
    should have_many(:store_transaction_line_items)
  end

  context 'validations' do
    PRODUCT_CATEGORIES.each do |category|
      should accept_nested_attributes_for(category)
        .allow_destroy(true)
    end
  end

  context 'delegations' do
    should delegate_method(:name).to(:category).with_prefix
    should delegate_method(:name).to(:style).with_prefix
  end
end
