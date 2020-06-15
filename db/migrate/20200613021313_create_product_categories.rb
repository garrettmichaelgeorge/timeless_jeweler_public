class CreateProductCategories < ActiveRecord::Migration[6.0]
  def change
    drop_table :product_categories, if_exists: true, force: true
    create_table :product_categories do |t|
      t.string :name, limit: 40

      t.timestamps
    end
    add_reference :products, :product_categories, foreign_key: true
  end
end
