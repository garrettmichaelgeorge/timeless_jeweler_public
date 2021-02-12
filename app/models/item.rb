# == Schema Information
#
# Table name: items
#
#  id                       :bigint           not null, primary key
#  acquired_at              :datetime         not null
#  category                 :string(20)
#  cost_cents               :integer          default(0), not null
#  cost_currency            :string           default("USD"), not null
#  description              :text
#  name                     :string(40)       not null
#  notes                    :text
#  price_cents              :integer          default(0), not null
#  price_currency           :string           default("USD"), not null
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#  item_ownership_status_id :bigint           not null
#  item_style_id            :bigint           not null
#  user_id                  :bigint           not null
#
# Indexes
#
#  index_items_on_item_ownership_status_id  (item_ownership_status_id)
#  index_items_on_item_style_id             (item_style_id)
#  index_items_on_user_id                   (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_ownership_status_id => item_ownership_statuses.id)
#  fk_rails_...  (item_style_id => item_styles.id)
#  fk_rails_...  (user_id => users.id)
#

require 'sti_preload'

class Item < ApplicationRecord
  include STIPreload

  # Warning: the following constant is deprecated
  CATEGORIES = %w[Piece LooseGemstone MiscellaneousItem].freeze

  self.inheritance_column = 'category'

  validates :name,     presence: true, length: { maximum: 40 }
  validates :category, presence: true, length: { maximum: 20 },
                       inclusion: { in: ->(*) { categories } }

  has_many :line_items,         inverse_of: :item, class_name: 'Sale::LineItem'
  belongs_to :user,             inverse_of: :items
  belongs_to :style,            inverse_of: :items,
                                class_name: 'ItemStyle', foreign_key: 'item_style_id'
  belongs_to :ownership_status, inverse_of: :items,
                                class_name: 'Item::OwnershipStatus', foreign_key: 'item_ownership_status_id'

  scope :for_user,            ->(user) { where(user: user) }
  scope :with_styles,         -> { includes(:style) }

  scope :pieces,              -> { where(category: 'Piece') }
  scope :gemstones,           -> { where(category: 'Gemstone') }
  scope :miscellaneous_items, -> { where(category: 'MiscellaneousItem') }

  delegate :name, to: :style, prefix: true
  delegate :code, to: :ownership_status, prefix: true

  monetize :cost_cents,  numericality: { greater_than_or_equal_to: 0 }
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }

  def salable
    category.underscore
  end

  def category=(value)
    super(standardize_category(value))
  end

  # required for Simple Form
  def to_label
    "#{name} (#{price})"
  end

  def sku(calculator = SKU)
    # TODO: finish implementing (see Item::SKU)
    @sku ||= calculator.new(context: self).sku
  end

  class << self
    def categories
      CATEGORIES
    end

    # https://www.christopherbloom.com/2012/02/01/notes-on-sti-in-rails-3-0/
    # Allows subclasses to all route through the parent model's controller
    def inherited(child)
      child.instance_eval do
        alias :original_model_name :model_name
        def model_name = Item.model_name
      end

      super
    end
  end

  private

  def standardize_category(value)
    value.to_s.camelize
  end
end
