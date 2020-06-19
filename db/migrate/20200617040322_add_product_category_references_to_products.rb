class AddProductCategoryReferencesToProducts < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :products, :product_categories
    add_reference :products, :product_category, null: false, foreign_key: true
  end
end
