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
class StoreTransactionLineItem < ApplicationRecord
  scope :current_transaction, ->(store_transaction_id) { where("store_transaction_id = ?", store_transaction_id) }
  # scope :total_amount, -> { sum("price") }


  # belongs_to :store_transaction, inverse_of: "line_item"
  belongs_to :store_transaction
  belongs_to :product
  accepts_nested_attributes_for :product

  monetize :price_cents
  monetize :tax_cents

  delegate :name, to: :product, prefix: true
  delegate :party_name, to: :store_transaction
  delegate :category_name, to: :store_transaction

  def self.total_cents
    current_transaction.store_transaction.total_cents
  end
end
