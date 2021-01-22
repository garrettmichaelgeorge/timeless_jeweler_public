# == Schema Information
#
# Table name: loose_gemstones
#
#  id                  :bigint           not null, primary key
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  gemstone_profile_id :bigint           not null
#  item_id             :bigint           not null
#
# Indexes
#
#  index_loose_gemstones_on_gemstone_profile_id  (gemstone_profile_id)
#  index_loose_gemstones_on_item_id              (item_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_profile_id => gemstone_profiles.id)
#  fk_rails_...  (item_id => items.id)
#

class LooseGemstone::Profile < ApplicationRecord
  self.table_name = 'loose_gemstones'

  belongs_to :loose_gemstone, inverse_of: :profile,
                              foreign_key: :item_id

  belongs_to :gemstone, inverse_of: :loose_gemstone,
                        class_name: 'Gemstone::Listing',
                        foreign_key: :gemstone_profile_id

  delegate :carat, :carat=,
           to: :lazily_built_gemstone

  scope :with_gemstone, -> { includes(:gemstone) }

  accepts_nested_attributes_for :gemstone

  private

  def lazily_built_gemstone
    gemstone || build_gemstone
  end
end
