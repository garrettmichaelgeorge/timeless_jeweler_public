# == Schema Information
#
# Table name: store_transaction_line_items
#
#  id                   :bigint           not null, primary key
#  discount_cents       :integer          default(0), not null
#  discount_currency    :string           default("USD"), not null
#  price_currency       :string           default("USD"), not null
#  quantity             :integer
#  tax_cents            :integer          default(0), not null
#  tax_currency         :string           default("USD"), not null
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  product_id           :bigint           not null
#  store_transaction_id :bigint           not null
#
# Indexes
#
#  index_store_transaction_line_items_on_product_id            (product_id)
#  index_store_transaction_line_items_on_store_transaction_id  (store_transaction_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => items.id)
#  fk_rails_...  (store_transaction_id => store_transactions.id)
#

require 'test_helper'

class StoreTransactionLineItemTest < ActiveSupport::TestCase
  context 'associations' do
    should belong_to(:item)
    should belong_to(:store_transaction)
  end

  context 'delegations' do
    should delegate_method(:name).to(:item).with_prefix(true)
    should delegate_method(:price_cents).to(:item).with_prefix(true)
    should delegate_method(:party_name).to(:store_transaction)
    should delegate_method(:category_name).to(:store_transaction)
    should delegate_method(:total).to(:store_transaction).with_prefix(true)
  end

  context 'monetize' do
    should('monetize discount') { _(subject.discount).must_be_instance_of Money }
    should('monetize tax')      { _(subject.tax).must_be_instance_of Money }
  end
end
