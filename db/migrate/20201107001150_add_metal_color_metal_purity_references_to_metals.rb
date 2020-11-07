class AddMetalColorMetalPurityReferencesToMetals < ActiveRecord::Migration[6.0]
  def change
    add_reference :metals, :metal_color, null: false, foreign_key: true
    add_reference :metals, :metal_purity, null: false, foreign_key: true
  end
end
