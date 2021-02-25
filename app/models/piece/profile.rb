# == Schema Information
#
# Table name: pieces
#
#  id                   :bigint           not null, primary key
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  item_id              :bigint           not null
#  piece_subcategory_id :bigint           not null
#
# Indexes
#
#  index_pieces_on_item_id               (item_id)
#  index_pieces_on_piece_subcategory_id  (piece_subcategory_id)
#
# Foreign Keys
#
#  fk_rails_...  (item_id => items.id)
#  fk_rails_...  (piece_subcategory_id => piece_subcategories.id)
#

class Piece
  class Profile < ApplicationRecord
    # Multiple Table Inheritance (MTI):
    # Contains attributes and relationships unique to pieces
    # Acts as the :piece interface to the outside world

    self.table_name = 'pieces'

    belongs_to :piece, inverse_of: :profile, foreign_key: 'item_id'

    # NOTE: Place all associations unique to Piece below
    belongs_to :subcategory, inverse_of: :pieces,
                             class_name: 'Piece::Subcategory', foreign_key: 'piece_subcategory_id'
    has_many :metals,    inverse_of: :piece, foreign_key: 'piece_id'
    has_many :mountings, inverse_of: :piece, foreign_key: 'piece_id'
    has_many :gemstones, through: :mountings, inverse_of: :piece

    accepts_nested_attributes_for :metals, :gemstones, :mountings,
                                  allow_destroy: true, reject_if: :all_blank

    validates_associated :metals, :gemstones

    delegate :code, :name, to: :subcategory, prefix: true, allow_nil: true
  end
end
