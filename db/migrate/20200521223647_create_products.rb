class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name, limit: 40
      t.text :description
      t.string :brand, limit: 40
      t.decimal :size, precision: 7, scale: 2
      t.string :size_unit
      t.decimal :weight, precision: 7, scale: 2
      t.string :weight_unit
      t.text :misc_measurements
      t.decimal :cost, precision: 10, scale: 2
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end
