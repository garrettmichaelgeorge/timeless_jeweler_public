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

  scope :with_purchase_history, -> { joins(sales: { line_items: :item }) }

  has_many :sales, -> { includes :line_items }
  has_many :items, through: :line_items
  has_many :line_items, through: :sales

  # delegate :name, to: :specific
  def name
    specific.name
  end
  alias party_name name

  def item_names
    items.map(&:name)
  end

  def sales_occurred_at
    sales.map(&:occurred_at)
  end

  def sales_total_cents
    sales.map(&:total_cents)
  end

  def item_ids
    sales.line_items.item_ids
  end
end
