class RenameStoreTransactionsAndOrderLineItems < ActiveRecord::Migration[6.1]
  def change
    rename_table :store_transactions, :sales if table_exists?(:store_transactions)
    rename_table :order_line_items, :sale_line_items if table_exists?(:order_line_items)

    rename_column :sales, :transaction_datetime, :occurred_at
  end
end
