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

class Mounting < ApplicationRecord
  # Join table between gemstones and pieces

  self.table_name = 'mounted_gemstones'

  belongs_to :gemstone, inverse_of: :mounting,
                        class_name: 'Gemstone::Mounted',
                        foreign_key: 'gemstone_profile_id'

  belongs_to :piece,    inverse_of: :mountings,
                        class_name: 'Piece::Profile',
                        foreign_key: 'piece_id'
end
