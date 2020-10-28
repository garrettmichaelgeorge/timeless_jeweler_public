class AddProductReferenceToJewelryPieces < ActiveRecord::Migration[6.0]
  def change
    add_reference :jewelry_pieces, :product, null: false, foreign_key: true
  end
end
