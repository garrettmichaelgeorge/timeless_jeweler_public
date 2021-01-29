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

  scope :with_purchase_history, -> { joins(purchases: { purchases: :item }) }

  has_many :purchases, -> { includes :line_items }, inverse_of: :party, class_name: 'Sale'
  has_many :purchase_line_items, through: :purchases, source: :line_items
  has_many :items, through: :purchase_line_items

  # delegate :name, to: :specific
  def name
    specific.name
  end
  alias party_name name

  def item_names
    items.map(&:name)
  end

  def item_ids
    items.map(&:id)
  end

  def purchases_occurred_at
    purchases.map(&:occurred_at)
  end

  def purchases_total_cents
    purchases.map(&:total_cents)
  end
end
