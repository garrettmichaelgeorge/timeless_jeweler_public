class CreateProductJewelryMetalCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :metal_categories do |t|
      t.string :name, limit: 20

      t.timestamps
    end
    add_index :metal_categories, :name, unique: true
  end
end
