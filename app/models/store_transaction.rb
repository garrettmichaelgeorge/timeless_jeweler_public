# frozen_string_literal: true

#
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
  belongs_to :category, class_name: 'StoreTransactionCategory',
                        inverse_of: :store_transaction
  has_many :line_items, class_name: 'StoreTransactionLineItem',
                        inverse_of: :store_transaction,
                        dependent: :destroy
  has_many :items, through: :line_items

  accepts_nested_attributes_for :line_items, allow_destroy: true
  accepts_nested_attributes_for :items

  monetize :total_cents

  # def total_cents
  # store_transaction_line_items.map { |li| li.product.select("price_cents").sum }
  # humanized_money_with_symbol(total)
  # end

  delegate :name, to: :category, prefix: true
  delegate :name, to: :party, prefix: true
  delegate :price, to: :line_items

  def total_cents
    products.sum('price_cents')
  end

  alias_attribute :store_transaction_line_items, :line_items
end
