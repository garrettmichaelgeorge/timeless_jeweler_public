class CreateProductCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :product_categories do |t|
      t.string :product_category_name

      t.timestamps
    end
  end
end
