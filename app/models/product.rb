# == Schema Information
#
# Table name: products
#
#  id               :bigint           not null, primary key
#  category         :string(20)
#  cost_cents       :integer          default(0), not null
#  cost_currency    :string           default("USD"), not null
#  description      :text
#  name             :string(40)       not null
#  notes            :text
#  price_cents      :integer          default(0), not null
#  price_currency   :string           default("USD"), not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  product_style_id :bigint           not null
#
# Indexes
#
#  index_products_on_product_style_id  (product_style_id)
#
# Foreign Keys
#
#  fk_rails_...  (product_style_id => product_styles.id)
#

class Product < ApplicationRecord
  PRODUCT_CATEGORIES = %i[jewelry_product
                          miscellaneous_product
                          gemstone_product].freeze

  # Scopes
  scope :jewelry,       -> { where category: 'JEWELRY' }
  scope :gemstone,      -> { where category: 'GEMSTONE' }
  scope :miscellaneous, -> { where category: 'MISCELLANEOUS' }

  # Callbacks
  before_save :build_subtype

  # Associations
  has_many :store_transaction_line_items

  belongs_to :style, class_name: 'Product::Style',
                     inverse_of: :products,
                     foreign_key: 'product_style_id'

  # Subtype associations
  has_one :jewelry_product,       class_name: 'Product::JewelryProduct',
                                  autosave: true,
                                  dependent: :destroy,
                                  validate: true,
                                  touch: true

  has_one :miscellaneous_product, class_name: 'Product::MiscellaneousProduct',
                                  autosave: true,
                                  dependent: :destroy,
                                  validate: true,
                                  touch: true

  has_one :gemstone_product,      class_name: 'Product::GemstoneProduct',
                                  autosave: true,
                                  dependent: :destroy,
                                  validate: true,
                                  touch: true

  has_one :gemstone,              through: :gemstone_product,
                                  autosave: true,
                                  dependent: :destroy,
                                  validate: true,
                                  touch: true

  accepts_nested_attributes_for :jewelry_product,
                                :gemstone_product,
                                :miscellaneous_product

  # Validations
  validates_presence_of :name

  def validate_exclusive(product_id, product_category_id)
    # TODO
  end

  # Presenters/Decorators
  # TODO: move to decorator/presenter/helper class
  def to_label
    "#{name} (#{price})"
  end

  # Delegations
  delegate :name, to: :style,
                  prefix: true

  monetize :cost_cents, numericality: { greater_than_or_equal_to: 0 }
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }

  private

  def build_subtype
    case category
    when 'JEWELRY'
      build_jewelry_product if jewelry_product.nil?
    when 'GEMSTONE'
      build_gemstone_product if gemstone_product.nil?
    when 'MISCELLANEOUS'
      build_miscellaneous_product if miscellaneous_product.nil?
    else
      raise StandardError, 'Cannot create product subtype due to invalid category'
    end
  end
end
