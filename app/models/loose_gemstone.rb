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
#  user_id        :bigint           not null
#
# Indexes
#
#  index_items_on_item_style_id  (item_style_id)
#  index_items_on_user_id        (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_style_id => item_styles.id)
#  fk_rails_...  (user_id => users.id)
#

class LooseGemstone < Item
  include Profilable

  has_one :profile, inverse_of: :loose_gemstone, foreign_key: 'item_id',
                    dependent: :destroy, autosave: true

  delegate_to_profile :carat, :carat=, :color_grade, :cut_grade, :clarity_grade, :gemstone_category

  class Profile < ApplicationRecord
    self.table_name = 'loose_gemstones'

    belongs_to :loose_gemstone, inverse_of: :profile,
                                foreign_key: :item_id

    belongs_to :gemstone, inverse_of: :listing,
                          class_name: 'Gemstone::Listed',
                          foreign_key: :gemstone_profile_id

    delegate :carat, :carat=,
             to: :lazily_built_gemstone

    delegate :category, to: :lazily_built_gemstone, prefix: true

    delegate_missing_to :lazily_built_gemstone

    scope :with_gemstone, -> { includes(:gemstone) }

    accepts_nested_attributes_for :gemstone

    private

    def lazily_built_gemstone
      gemstone || build_gemstone
    end
  end
end
