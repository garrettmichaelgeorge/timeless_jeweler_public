class RemovePriceCostColumnsFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :cost, :decimal
    remove_column :products, :price, :decimal
    remove_column :store_transaction_line_items, :price_cents, :integer
    change_table :products do |t|
      t.monetize :cost
      t.monetize :price
    end
    change_table :store_transaction_line_items do |t|
      t.monetize :discount
    end
  end
end
