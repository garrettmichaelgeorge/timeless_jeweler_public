# == Schema Information
#
# Table name: items
#
#  id             :bigint           not null, primary key
#  cost_cents     :integer          default(0), not null
#  cost_currency  :string           default("USD"), not null
#  description    :text
#  name           :string(40)       not null
#  notes          :text
#  price_cents    :integer          default(0), not null
#  price_currency :string           default("USD"), not null
#  salable_type   :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  item_style_id  :bigint           not null
#  salable_id     :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#  index_products_on_salable     (salable_type,salable_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#

class Item < ApplicationRecord
  include GlobalID::Identification

  # Associations
  has_many :store_transaction_line_items

  belongs_to :style, class_name: 'ItemStyle',
                     inverse_of: :items,
                     foreign_key: 'item_style_id'

  #-- Salable
  delegated_type :salable, types: Salable::TYPES,
                           inverse_of: :item,
                           dependent: :destroy

  accepts_nested_attributes_for :salable

  scope :with_salables, -> { includes(:salable) }

  # Validations
  validates :name, presence: true,
                   length: { maximum: 40 }

  # Delegations
  delegate :name, to: :style,
                  prefix: true

  # Monetizers
  monetize :cost_cents, numericality: { greater_than_or_equal_to: 0 }
  monetize :price_cents, numericality: { greater_than_or_equal_to: 0 }

  def to_label
    "#{name} (#{price})"
  end

  def assign_salable_type(salable_type)
    self.salable_type = salable_type.to_s.upcase
    build_salable
  end

  def salable_gid
    salable&.to_global_id
  end

  def salable_gid=(salable)
    self.salable = GlobalID::Locator.locate salable
  end

  class << self
    # Factory methods
    Salable::TYPES.each do |salable_type|
      salable_class = salable_type.constantize

      define_method "create_as_#{salable_type.underscore}!" do |**options|
        public_send create!(salable: salable_class.new, **options)
      end

      define_method "build_as_#{salable_type.downcase}" do |**options|
        public_send new(salable: Piece.new, **options)
      end
    end

    def build_as(salable_type = :piece, **options)
      public_send("build_as_#{salable_type}", **options)
    end

    # def build_as_piece(*options)
    #   new(salable: Piece.new, **options)
    # end

    # def build_as_gemstone(*options)
    #   new(salable: Gemstone.new, **options)
    # end

    # def build_as_miscellaneous_item(*options)
    #   new(salable: MiscellaneousItem.new, **options)
    # end

    # def create_as_piece!(*options)
    #   new(salable: Piece.new, **options)
    # end

    # def create_as_gemstone!(*options)
    #   new(salable: Gemstone.new, **options)
    # end

    # def create_as_miscellaneous!(*options)
    #   new(salable: MiscellaneousItem.new, **options)
    # end
  end

  private

  def normalize_salable_type
    self.salable_type = salable_type.upcase
  end
end
