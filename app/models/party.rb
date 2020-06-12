# frozen_string_literal: true

# == Schema Information
#
# Table name: parties
#
#  id           :bigint           not null, primary key
#  actable_type :string
#  party_type   :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  actable_id   :integer
#
class Party < ApplicationRecord
  actable

  scope :purchase_history, -> { joins(store_transactions: { store_transaction_line_items: :product }) }

  has_many :store_transactions, -> { includes :store_transaction_line_items }
  has_many :store_transaction_line_items, through: :store_transactions
  has_many :products,                     through: :store_transaction_line_items

  before_validation do |party|
  end

  def name
    specific.name
  end

  def product_names
    # equivalent to: products.map { |p| p.name }
    products.map(&:name)
  end

  def store_transaction_datetime
    store_transactions.map(&:transaction_datetime)
  end

  def store_transaction_total_cents
    store_transactions.map(&:total_cents)
  end

  def product_ids
    store_transactions.store_transaction_line_items.product_ids
  end

  

  alias party_name name

  # def self.purchase_history(party_id)
  # joins(store_transactions: { store_transaction_line_items: :product }).find(party_id)
  # end
end
