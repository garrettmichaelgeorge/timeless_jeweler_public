# == Schema Information
#
# Table name: products
#
#  id               :bigint           not null, primary key
#  category         :string(20)       not null
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

  context 'associations' do
    should have_many(:store_transaction_line_items)
    should belong_to(:style)

    context 'salable types' do
      PRODUCT_CATEGORIES.each do |category|
        should have_one(category)
          .dependent(:destroy)
          .touch(true)
        should accept_nested_attributes_for(category)
      end
    end
  end

  context 'scopes' do
  end

  context 'validations' do
    should validate_presence_of(:name)
    should validate_length_of(:name).is_at_most(40)
    should validate_presence_of(:category)
    should validate_inclusion_of(:category)
      .in_array(%w[JEWELRY GEMSTONE MISCELLANEOUS])
  end

  context 'delegations' do
    subject { Product.build_as(:gemstone) }
    should delegate_method(:name).to(:style).with_prefix

    context '.delegate_missing_to' do
      should delegate_method(:public_send).to(:salable).with_arguments(:carat)
    end
  end

  context 'monetize' do
    should('monetize price') { _(subject.price).must_be_instance_of Money }
    should('monetize cost')  { _(subject.cost).must_be_instance_of Money }
  end

  context '.build_as' do
    should 'create gemstone object' do
      subject { Product.build_as(:gemstone) }
      _(subject.salable.product).must_equal subject, 'Salable association invalid'
    end

    should 'create new gemstone product' do
      subject { Product.build_as(:gemstone, *FactoryBot.attributes_for(:product, :gemstone)) }
      assert subject.save, "Product save failed with errors: #{subject.errors.messages}"
    end

    should 'create new jewelry product' do
      subject { Product.build_as(:jewelry, *FactoryBot.attributes_for(:product, :jewelry)) }
      assert subject.save, "Product save failed with errors: #{subject.errors.messages}"
    end

    should 'create new miscellaneous product' do
      subject { Product.build_as(:miscellaneous, *FactoryBot.attributes_for(:product, :miscellaneous)) }
      assert subject.save, "Product save failed with errors: #{subject.errors.messages}"
    end
  end
end
