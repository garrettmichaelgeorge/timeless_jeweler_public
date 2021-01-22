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

class MountedGemstone < ApplicationRecord
  include Profilable

  belongs_to :piece,   inverse_of: :mounted_gemstones,
                       class_name: 'PieceProfile'
  belongs_to :profile, inverse_of: :mounted_gemstone,
                       class_name: 'Gemstone', foreign_key: :gemstone_profile_id
end
