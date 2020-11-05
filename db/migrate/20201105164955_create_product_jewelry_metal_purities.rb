class CreateProductJewelryMetalPurities < ActiveRecord::Migration[6.0]
  def change
    create_table :metal_purities do |t|
      t.string :value, limit: 4

      t.timestamps
    end
    add_index :metal_purities, :value, unique: true
  end
end
