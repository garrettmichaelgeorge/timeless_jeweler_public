# frozen_string_literal: true

#
# == Schema Information
#
# Table name: sales
#
#  id          :bigint           not null, primary key
#  occurred_at :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  party_id    :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_sales_on_occurred_at  (occurred_at) UNIQUE
#  index_sales_on_party_id     (party_id)
#  index_sales_on_user_id      (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (party_id => parties.id)
#  fk_rails_...  (user_id => users.id)
#

class Sale < ApplicationRecord
  belongs_to :user
  belongs_to :party
  has_many :line_items, inverse_of: :sale, dependent: :destroy
  has_many :items,      through: :line_items

  accepts_nested_attributes_for :line_items, allow_destroy: true

  monetize :total_cents

  delegate :price, to: :line_items
  delegate :name,  to: :party, prefix: true

  def total_cents
    line_items.sum('actual_price_cents')
  end

  # Allows legacy usage.
  # FIXME: Remove this asap
  alias_attribute :store_transaction_line_items, :line_items
end
