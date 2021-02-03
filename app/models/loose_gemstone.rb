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
  has_one :profile, inverse_of: :loose_gemstone, foreign_key: 'item_id',
                    dependent: :destroy, autosave: true

  # Must include Profilable after defining :profile association
  include Profilable

  delegate_to_profile :gemstone, :carat, :carat=,
                      :color_grade, :cut_grade, :clarity_grade,
                      :gemstone_category

  class Profile < ApplicationRecord
    self.table_name = 'loose_gemstones'

    after_initialize do
      build_gemstone if gemstone.nil?
    end

    belongs_to :loose_gemstone, inverse_of: :profile, foreign_key: 'item_id'
    belongs_to :gemstone,       inverse_of: :listing, foreign_key: 'gemstone_profile_id',
                                class_name: 'Gemstone::Listed'

    delegate_missing_to :gemstone

    scope :with_gemstone, -> { includes(:gemstone) }

    accepts_nested_attributes_for :gemstone
  end
end
