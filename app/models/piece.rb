# == Schema Information
#
# Table name: pieces
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  item_id    :bigint           not null
#
# Indexes
#
#  index_pieces_on_item_id  (item_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#

class Piece < ApplicationRecord
  has_many :metals,                inverse_of: :piece
  has_many :mounted_gemstones,     inverse_of: :piece
  belongs_to :item, -> { pieces }, inverse_of: :piece

  accepts_nested_attributes_for :metals,
                                :mounted_gemstones, allow_destroy: true,
                                                    reject_if: :all_blank
end
