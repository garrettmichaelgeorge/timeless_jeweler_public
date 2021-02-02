# == Schema Information
#
# Table name: mountings
#
#  gemstone_id :bigint           not null
#  piece_id    :bigint           not null
#
# Indexes
#
#  index_mountings_on_gemstone_id  (gemstone_id)
#  index_mountings_on_piece_id     (piece_id)
#
# Foreign Keys
#
#  fk_rails_...  (gemstone_id => gemstones.id)
#  fk_rails_...  (piece_id => pieces.id)
#

class Mounting < ApplicationRecord
  # Join table between gemstones and pieces

  belongs_to :gemstone, inverse_of: :mounting,
                        class_name: 'Gemstone::Mounted',
                        foreign_key: 'gemstone_id'

  belongs_to :piece,    inverse_of: :mountings,
                        class_name: 'Piece::Profile',
                        foreign_key: 'piece_id'

  accepts_nested_attributes_for :gemstone
end
