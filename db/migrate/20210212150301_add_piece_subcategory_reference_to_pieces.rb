class AddPieceSubcategoryReferenceToPieces < ActiveRecord::Migration[6.1]
  def change
    add_reference :pieces, :piece_subcategory, null: false, foreign_key: true
  end
end
