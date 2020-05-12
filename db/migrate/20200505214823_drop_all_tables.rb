class DropAllTables < ActiveRecord::Migration[6.0]
  def change
    drop_table :customers
    drop_table :households
    drop_table :products
    drop_table :product_categories
  end
end
