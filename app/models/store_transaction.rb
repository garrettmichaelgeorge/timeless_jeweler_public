# == Schema Information
#
# Table name: store_transactions
#
#  id                            :bigint           not null, primary key
#  transaction_datetime          :datetime
#  created_at                    :datetime         not null
#  updated_at                    :datetime         not null
#  party_id                      :bigint           not null
#  store_transaction_category_id :bigint           not null
#
# Indexes
#
#  index_store_transactions_on_party_id                       (party_id)
#  index_store_transactions_on_store_transaction_category_id  (store_transaction_category_id)
#
# Foreign Keys
#
#  fk_rails_...  (party_id => parties.id)
#  fk_rails_...  (store_transaction_category_id => store_transaction_categories.id)
#
class StoreTransaction < ApplicationRecord
  # scope :total_amount, ->(id) { joins(:store_transaction_line_items).where(id: id).sum("store_transaction_line_items.price_cents") }

  belongs_to :party
  belongs_to :category, class_name: "StoreTransactionCategory", foreign_key: "store_transaction_category_id"
  # has_many :line_items, class_name: "StoreTransactionLineItem", inverse_of: :store_transaction, dependent: :destroy
  has_many :store_transaction_line_items, dependent: :destroy
  has_many :products, through: :store_transaction_line_items
  accepts_nested_attributes_for :store_transaction_line_items, allow_destroy: true

  validates :party_id, null: false
  validates :store_transaction_category_id, null: false

  monetize :total_cents

  def total_cents
    total = store_transaction_line_items.sum("price_cents")
    # humanized_money_with_symbol(total)
  end

  delegate :name, to: :category, prefix: true
  delegate :name, to: :party, prefix: true

  private

end
