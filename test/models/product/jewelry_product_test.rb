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
# Foreign Keys
#
#  fk_rails_...  (product_id => products.id)
#
require 'test_helper'

class Product
  class JewelryProductTest < ActiveSupport::TestCase
    context 'associations' do
      should have_many(:mounted_gemstones)
      should have_many(:gemstones).through(:mounted_gemstones)
      should belong_to(:product)
        .conditions(category: 'JEWELRY')
    end

    context 'delegations' do
      delegated_methods = %i[name
                             description
                             notes
                             cost
                             price]
      delegated_methods.each do |method|
        should delegate_method(method).to(:product)
      end
    end

    test "doesn't save when associated product's category is not JEWELRY" do
      @jewelry_product = FactoryBot.build(:jewelry_product)
      assert_not_nil @jewelry_product.product
    end
  end
end
