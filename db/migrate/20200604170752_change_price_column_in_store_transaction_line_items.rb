class ChangePriceColumnInStoreTransactionLineItems < ActiveRecord::Migration[6.0]
  def change
    change_table :store_transaction_line_items do |t| 
      t.rename :price, :price_cents
    end
    change_column :store_transaction_line_items, :price_cents, :integer, limit: 8
  end
end
