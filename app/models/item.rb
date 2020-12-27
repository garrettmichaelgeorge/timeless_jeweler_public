# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  category       :string(20)
#  cost_cents     :integer          default(0), not null
#  cost_currency  :string           default("USD"), not null
#  description    :text
#  name           :string(40)       not null
#  notes          :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_style_id  :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#

class Item < ApplicationRecord
  CATEGORIES = %w[Piece Gemstone MiscellaneousItem].freeze

  include GlobalID::Identification

  before_save :ensure_salable_exists, if: :new_record?,
                                      unless: :category?

  validates :name,     presence: true, length: { maximum: 40 }
  validates :category, presence: true, length: { maximum: 20 }, inclusion: CATEGORIES
  validates_associated :piece, :gemstone, :miscellaneous_item

  has_many :store_transaction_line_items, inverse_of: :items
  belongs_to :style, inverse_of: :items,
                     class_name: 'ItemStyle', foreign_key: 'item_style_id'

  has_one :piece,              inverse_of: :item
  has_one :gemstone,           inverse_of: :item, class_name: 'LooseGemstone'
  has_one :miscellaneous_item, inverse_of: :item

  scope :with_salables,       -> { includes(:salable) }
  scope :pieces,              -> { where(category: 'Piece') }
  scope :gemstones,           -> { where(category: 'Gemstone') }
  scope :miscellaneous_items, -> { where(category: 'MiscellaneousItem') }

  delegate :name, to: :style, prefix: true

  accepts_nested_attributes_for :piece,
                                :gemstone,
                                :miscellaneous_item,
                                reject_if: :all_blank

  monetize :cost_cents,  numericality: { greater_than_or_equal_to: 0 }
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }

  def to_label
    "#{name} (#{price})"
  end

  def salable
    public_send category.underscore
  end

  def category=(value)
    if persisted?
      raise ValidationError,
            'Cannot change category for a saved record!'
    end

    standardized_category = value.to_s.camelize
    super(standardized_category)
  end

  class << self
    def build_as(category, **attrs)
      public_send "build_as_#{category.underscore}", **attrs
    end

    def build_as_piece(**attrs)
      pieces.build(**attrs, &:build_piece)
    end

    def build_as_gemstone(**attrs)
      gemstones.build(**attrs, &:build_gemstone)
    end

    def build_as_miscellaneous_item(**attrs)
      miscellaneous_items.build(**attrs, &:build_miscellaneous_item)
    end
  end

  private

  def ensure_salable_exists
    public_send "build_#{category.underscore}"
  end

  def category?
    category.empty?
  end
end
