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

class LooseGemstone < ApplicationRecord
  delegate_missing_to :profile

  belongs_to :item,    -> { gemstones }, inverse_of: :gemstone
  belongs_to :profile, -> { loose },     inverse_of: :loose_gemstone,
                                         class_name: 'Gemstone', foreign_key: :gemstone_profile_id
end
