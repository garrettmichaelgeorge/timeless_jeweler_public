# == Schema Information
#
# Table name: store_transaction_line_items
#
#  id                   :bigint           not null, primary key
#  price                :decimal(10, 2)
#  quantity             :integer
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
class StoreTransactionLineItem < ApplicationRecord
  # belongs_to :store_transaction, inverse_of: "line_item"
  belongs_to :store_transaction
  belongs_to :product
  accepts_nested_attributes_for :product

  private

  def total(store_transaction_id)
  end

end
