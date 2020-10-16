# == Schema Information
#
# Table name: products
#
#  id                  :bigint           not null, primary key
#  cost_cents          :integer          default(0), not null
#  cost_currency       :string           default("USD"), not null
#  description         :text
#  name                :string(40)       not null
#  notes               :text
#  price_cents         :integer          default(0), not null
#  price_currency      :string           default("USD"), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  product_category_id :bigint           not null
#  product_style_id    :bigint           not null
#
# Indexes
#
#  index_products_on_product_category_id  (product_category_id)
#  index_products_on_product_style_id     (product_style_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_category_id => product_categories.id)
#  fk_rails_...  (product_style_id => product_styles.id)
#
class Product < ApplicationRecord
  monetize :price_cents
  monetize :cost_cents

  has_many :store_transaction_line_items
  belongs_to :category, class_name: 'ProductCategory',
                        inverse_of: :products,
                        foreign_key: 'product_category_id'

  belongs_to :style, class_name: 'ProductStyle',
                     inverse_of: :products,
                     foreign_key: 'product_style_id'

  def to_label
    "#{self.name} (#{self.price})"
  end

  delegate :name, to: :category,
                  prefix: true

  delegate :name, to: :style,
                  prefix: true
end
