# == Schema Information
#
# Table name: jewelry_pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  product_id :bigint           not null
#
# Indexes
#
#  index_jewelry_pieces_on_product_id  (product_id)
#
require 'test_helper'

class Product
  class JewelryProductTest < ActiveSupport::TestCase
    context 'associations' do
      should have_many(:mounted_gemstones)
      should belong_to(:product).conditions(category: 'JEWELRY')
      should have_many(:metals)
    end

    context 'delegations' do
      context 'product' do
        product_methods = %i[name
                             description
                             notes
                             cost
                             price]
        product_methods.each do |method|
          should delegate_method(method).to(:product)
        end
      end

      context 'metals' do
        metal_methods = %i[category
                           color
                           purity]

        metal_methods.each do |method|
          should delegate_method(method).to(:metals).with_prefix
        end
      end
    end

    context '.build' do
      should_eventually "not save when associated product's category is not JEWELRY" do
        # FIXME
        @jewelry_product = FactoryBot.build(:jewelry_product)
        _(@jewelry_product.product).wont_be_nil
      end
    end
  end
end
