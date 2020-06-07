class DropPriceCentsFromStoreTransactionLineItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :store_transaction_line_items, :price_cents
    add_monetize :store_transaction_line_items, :price, limit: 8
  end
end
