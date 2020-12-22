# == Schema Information
#
# Table name: mounted_gemstones
#
#  gemstone_profile_id :bigint           not null
#  piece_id            :bigint           not null
#
# Indexes
#
#  index_mounted_gemstones_on_gemstone_profile_id  (gemstone_profile_id)
#  index_mounted_gemstones_on_piece_id             (piece_id)
#
FactoryBot.define do
  factory :mounted_gemstone do
    association :piece
    association :profile, factory: :gemstone_profile
  end
end
