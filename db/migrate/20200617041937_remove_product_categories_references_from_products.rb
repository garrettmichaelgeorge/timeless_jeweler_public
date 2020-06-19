class RemoveProductCategoriesReferencesFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :product_categories
  end
end
