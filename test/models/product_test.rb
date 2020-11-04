# == Schema Information
#
# Table name: products
#
#  id               :bigint           not null, primary key
#  category         :string(20)
#  cost_cents       :integer          default(0), not null
#  cost_currency    :string           default("USD"), not null
#  description      :text
#  name             :string(40)       not null
#  notes            :text
#  price_cents      :integer          default(0), not null
#  price_currency   :string           default("USD"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_style_id :bigint           not null
#
# Indexes
#
#  index_products_on_product_style_id  (product_style_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_style_id => product_styles.id)
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  PRODUCT_CATEGORIES = %i[jewelry_product
                          miscellaneous_product
                          gemstone_product].freeze

  def setup; end

  test 'creates new product' do
    @new_product = FactoryBot.build(:product)
    assert @new_product.save, 'Expected to save Product with valid attributes'
  end

  test 'creates new jewelry product on save' do
    @new_product = FactoryBot.build(:product, category: 'JEWELRY')
    @new_product.save
    assert_not @new_product.jewelry_product.nil?
  end

  context 'associations' do
    should belong_to(:style)
    should have_many(:store_transaction_line_items)

    context 'product subtypes' do
      should have_one(:gemstone_product)
        .dependent(:destroy)
        .validate(true)
        .touch(true)
        .autosave(true)

      should have_one(:gemstone)
        .through(:gemstone_product)
        .dependent(:destroy)
        .validate(true)
        .touch(true)
        .autosave(true)

      should have_one(:miscellaneous_product)
        .dependent(:destroy)
        .validate(true)
        .touch(true)
        .autosave(true)

      should have_one(:jewelry_product)
        .dependent(:destroy)
        .validate(true)
        .touch(true)
        .autosave(true)
    end
  end

  context 'nested_attributes' do
    should accept_nested_attributes_for(:jewelry_product)
    should accept_nested_attributes_for(:gemstone_product)
    should accept_nested_attributes_for(:miscellaneous_product)
  end

  context 'scopes' do
  end

  context 'validations' do
    should validate_presence_of(:name)
  end

  context 'delegations' do
    should delegate_method(:name).to(:style).with_prefix
  end

  context 'monetize' do
    should 'monetize price' do
      assert_instance_of(Money, subject.price)
    end

    should 'monetize cost' do
      assert_instance_of(Money, subject.cost)
    end
  end
end
