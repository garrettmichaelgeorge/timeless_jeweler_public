# == Schema Information
#
# Table name: jewelry_pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class JewelryPiece < ApplicationRecord
  has_many :gemstones, through: :mountings
end
