class AddPieceSubcategoryReferenceToPieces < ActiveRecord::Migration[6.2]
  def change
    add_reference :pieces, :piece_subcategory, null: false, foreign_key: true
  end
end
