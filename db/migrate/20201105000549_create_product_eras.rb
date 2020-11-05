class CreateProductEras < ActiveRecord::Migration[6.0]
  def change
    create_table :product_eras do |t|
      t.string :name, limit: 40

      t.timestamps
    end
    add_index :product_eras, :name, unique: true
  end
end
