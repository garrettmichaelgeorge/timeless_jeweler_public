class CreateProductStyles < ActiveRecord::Migration[6.0]
  def change
    create_table :product_styles do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :product_styles, :name, unique: true
  end
end
