# == Schema Information
#
# Table name: sale_line_items
#
#  id                    :bigint           not null, primary key
#  actual_price_cents    :integer          default(0), not null
#  actual_price_currency :string           default("USD"), not null
#  discount_cents        :integer          default(0), not null
#  discount_currency     :string           default("USD"), not null
#  price_currency        :string           default("USD"), not null
#  quantity              :integer
#  tax_cents             :integer          default(0), not null
#  tax_currency          :string           default("USD"), not null
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#  product_id            :bigint           not null
#  sale_id               :bigint           not null
#
# Indexes
#
#  index_sale_line_items_on_product_id  (product_id)
#  index_sale_line_items_on_sale_id     (sale_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_id => items.id)
#  fk_rails_...  (sale_id => sales.id)
#

class Sale
  class LineItem < ApplicationRecord
    self.table_name = 'sale_line_items'

    scope :with_items,   ->     { includes(:item) }
    scope :for_sale,     ->(id) { where('sale_id = ?', id) }
    scope :total_cents,  ->(id) { with_items.for_sale(id).sum('price_cents') }

    belongs_to :item, inverse_of: :line_items, foreign_key: 'product_id'
    belongs_to :sale, inverse_of: :line_items

    accepts_nested_attributes_for :item

    monetize :discount_cents
    monetize :tax_cents
    monetize :actual_price_cents

    delegate :name, :price_cents,
             to: :item, prefix: true
    delegate :party_name, :category_name,
             to: :sale
    delegate :total, to: :sale, prefix: true
  end
end
