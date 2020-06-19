# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  acquired_on         :date
#  brand               :string(40)
#  clarity             :string
#  color               :string
#  cost_cents          :integer          default(0), not null
#  cost_currency       :string           default("USD"), not null
#  description         :text
#  long_name           :string(255)
#  metal               :string
#  misc_measurements   :text
#  price_cents         :integer          default(0), not null
#  price_currency      :string           default("USD"), not null
#  purity              :string
#  report_number       :string
#  short_name          :string(40)
#  size                :decimal(7, 2)
#  size_unit           :string
#  weight              :decimal(7, 2)
#  weight_unit         :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :bigint           not null
#
# Indexes
#
#  index_products_on_product_category_id  (product_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_category_id => product_categories.id)
#
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
