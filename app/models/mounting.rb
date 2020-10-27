# == Schema Information
#
# Table name: mountings
#
#  gemstone_id      :bigint           not null
#  jewelry_piece_id :bigint           not null
#
# Indexes
#
#  index_mountings_on_gemstone_id       (gemstone_id)
#  index_mountings_on_jewelry_piece_id  (jewelry_piece_id)
#
class Mounting < ApplicationRecord
  belongs_to :gemstone
  belongs_to :jewelry_piece
end
