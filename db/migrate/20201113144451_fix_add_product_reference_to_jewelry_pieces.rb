require_relative '20201028144401_add_product_reference_to_jewelry_pieces'

class FixAddProductReferenceToJewelryPieces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :jewelry_pieces, :products
    change_column_null :jewelry_pieces, :product_id, false
  end
end
