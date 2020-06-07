# == Schema Information
#
# Table name: store_transaction_line_items
#
#  id                   :bigint           not null, primary key
#  price_cents          :integer          default(0), not null
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
#  fk_rails_...  (product_id => products.id)
#  fk_rails_...  (store_transaction_id => store_transactions.id)
#
require 'test_helper'

class StoreTransactionLineItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
