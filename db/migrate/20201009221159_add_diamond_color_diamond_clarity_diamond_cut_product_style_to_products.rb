class AddDiamondColorDiamondClarityDiamondCutProductStyleToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :diamond_color, foreign_key: true
    add_reference :products, :diamond_clarity, foreign_key: true
    add_reference :products, :diamond_cut, foreign_key: true
    add_reference :products, :product_style, foreign_key: true
  end
end
