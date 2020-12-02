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
class StoreTransactionLineItem < ApplicationRecord
  scope :specific_transaction, ->(store_transaction_id) { joins(:product).where("store_transaction_id = ?", store_transaction_id) }
  scope :current_transaction, ->(store_transaction_id) { joins(:product).where("store_transaction_id = ?", store_transaction_id) }
  # scope :total_amount, -> { sum("price") }
  # scope :total_amount, -> { sum("price") }


  belongs_to :store_transaction, inverse_of: :line_items,
                                 foreign_key: "store_transaction_id"
  # belongs_to :store_transaction
  belongs_to :product
  accepts_nested_attributes_for :product

  monetize :discount_cents
  monetize :tax_cents

  delegate :name, :price_cents, to: :product, prefix: true
  delegate :party_name, :category_name, to: :store_transaction
  delegate :total, to: :store_transaction, prefix: true

  def self.total_cents(store_transaction_id)
    specific_transaction(store_transaction_id).sum("price_cents")
  end

end
