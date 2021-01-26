# == Schema Information
#
# Table name: sale_line_items
#
#  id                    :bigint           not null, primary key
#  actual_price_cents    :integer          default(0), not null
#  actual_price_currency :string           default("USD"), not null
#  discount_cents        :integer          default(0), not null
#  discount_currency     :string           default("USD"), not null
#  price_currency        :string           default("USD"), not null
#  quantity              :integer
#  tax_cents             :integer          default(0), not null
#  tax_currency          :string           default("USD"), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  product_id            :bigint           not null
#  sale_id               :bigint           not null
#
# Indexes
#
#  index_sale_line_items_on_product_id  (product_id)
#  index_sale_line_items_on_sale_id     (sale_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => items.id)
#  fk_rails_...  (sale_id => sales.id)
#

require 'test_helper'

describe Sale::LineItem do
  subject { described_class.new }

  context 'associations' do
    should belong_to(:item)
    should belong_to(:sale)
  end

  context 'delegations' do
    should delegate_method(:name).to(:item).with_prefix(true)
    should delegate_method(:price_cents).to(:item).with_prefix(true)
    should delegate_method(:party_name).to(:sale)
    should delegate_method(:category_name).to(:sale)
    should delegate_method(:total).to(:sale).with_prefix(true)
  end

  it 'monetizes the attributes' do
    _(subject).must_monetize :discount, :tax, :actual_price
  end
end
