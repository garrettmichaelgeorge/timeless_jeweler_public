class RemoveProductReferencesFromJewelryProductsGemstoneProductsMiscellaneousProducts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :jewelry_pieces, :product, foreign_key: true, null: false
    remove_reference :miscellaneous_products, :product, null: false
    remove_reference :gemstone_products, :product, foreign_key: true, null: false
  end
end
