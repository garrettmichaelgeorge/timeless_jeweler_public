class AddJewelryPieceReferenceToMetals < ActiveRecord::Migration[6.0]
  def change
    add_reference :metals, :jewelry_piece, null: false, foreign_key: true
  end
end
