class RenameStoreTransactionLineItems < ActiveRecord::Migration[6.2]
  def change
    rename_table 'store_transaction_line_items', 'order_line_items'
  end
end
