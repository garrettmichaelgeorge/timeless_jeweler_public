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

class PieceProfile < ApplicationRecord
  self.table_name = 'pieces'

  belongs_to :piece,           inverse_of: :profile, foreign_key: 'item_id'
  has_many :metals,            inverse_of: :piece, foreign_key: 'piece_id'
  has_many :mounted_gemstones, inverse_of: :piece, foreign_key: 'piece_id'

  accepts_nested_attributes_for :metals, :mounted_gemstones,
                                allow_destroy: true, reject_if: :all_blank

  validates_associated :metals
end
