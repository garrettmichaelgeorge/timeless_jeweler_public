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

  def self.total
  end

  # belongs_to :store_transaction, inverse_of: "line_item"
  belongs_to :store_transaction
  belongs_to :product
  accepts_nested_attributes_for :product

  monetize :price_cents
  monetize :tax_cents

  def product_id
    self.product.id
  end

  def product_name
    self.product.name
  end

  def store_transaction_party_name
    self.store_transaction.party.name
  end

end
