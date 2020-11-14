# == Schema Information
#
# Table name: products
#
#  id               :bigint           not null, primary key
#  category         :string(20)       not null
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

  # Callbacks
  # after_initialize :build_salable
  # FIXME: breaks tests for unknown reason
  # before_validation :normalize_category

  # Scopes
  scope :jewelry,       -> { where category: 'JEWELRY' }
  scope :gemstone,      -> { where category: 'GEMSTONE' }
  scope :miscellaneous, -> { where category: 'MISCELLANEOUS' }

  # Associations
  has_many :store_transaction_line_items

  belongs_to :style, class_name: 'Product::Style',
                     inverse_of: :products,
                     foreign_key: 'product_style_id'

  #-- Subtypes
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

  accepts_nested_attributes_for :jewelry_product,
                                :gemstone_product,
                                :miscellaneous_product,
                                allow_destroy: true,
                                reject_if: :all_blank

  # Validations
  validates :name, presence: true,
                   length: { maximum: 40 }

  validates :category, presence: true,
                       inclusion: { in: %w[JEWELRY GEMSTONE MISCELLANEOUS] }

  validates_associated :gemstone_product, :jewelry_product, :miscellaneous_product

  def validate_exclusive(product_id, product_category_id)
    # TODO
  end

  # Delegations
  delegate :name, to: :style,
                  prefix: true

  # delegate_missing_to :salable
  delegate :carat, :carat=, to: :gemstone_product

  # Presenters
  # TODO: move to presenter class
  def to_label
    "#{name} (#{price})"
  end

  # Monetizers
  monetize :cost_cents, numericality: { greater_than_or_equal_to: 0 }
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }

  alias_attribute :salable_type, :category

  def assign_category(category)
    self.category = category.to_s.upcase
    build_salable
  end

  class << self
    # Factory methods
    def build_as(category = :jewelry, **options)
      new(**options) do |product|
        product.assign_category(category)
      end
    end
  end

  def salable
    case salable_type
    when 'JEWELRY'
      jewelry_product
    when 'GEMSTONE'
      gemstone_product
    when 'MISCELLANEOUS'
      miscellaneous_product
    end
  end

  private

  def salable_class
    salable_type.constantize
  end

  def salable_name
    salable_class.model_name.singular.inquiry
  end

  def build_salable
    case category
    when 'JEWELRY'
      build_jewelry_product if jewelry_product.nil?
    when 'GEMSTONE'
      build_gemstone_product if gemstone_product.nil?
    when 'MISCELLANEOUS'
      build_miscellaneous_product if miscellaneous_product.nil?
    else
      raise StandardError,
            'Cannot create salable due to invalid category'
    end
  end

  def normalize_category
    self.category = category.upcase
  end
end
