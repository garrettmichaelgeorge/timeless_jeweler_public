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
  PRODUCT_CATEGORIES = %i[jewelry_product
                          miscellaneous_product
                          gemstone_product].freeze

  # Associations
  has_many :store_transaction_line_items
  belongs_to :category, class_name: 'Product::Category',
                        inverse_of: :products,
                        foreign_key: 'product_category_id'

  belongs_to :style, class_name: 'Product::Style',
                     inverse_of: :products,
                     foreign_key: 'product_style_id'

  # Subtype associations
  has_one :jewelry_product,         class_name: 'Product::JewelryProduct'
  has_one :miscellaneous_product,   class_name: 'Product::MiscellaneousProduct'
  has_one :gemstone_product,        class_name: 'Product::GemstoneProduct'
  has_one :gemstone,                through: :gemstone_product

  # Validations
  PRODUCT_CATEGORIES.each do |category|
    accepts_nested_attributes_for category, allow_destroy: true
  end

  validates_associated(*PRODUCT_CATEGORIES)

  def validate_exclusive(product_id, product_category_id); end

  # TODO: move to decorator/presenter/helper class
  def to_label
    "#{name} (#{price})"
  end

  # Delegations
  delegate :name, to: :category,
                  prefix: true

  delegate :name, to: :style,
                  prefix: true
end
