class RenameStoreTransactionIdInSaleLineItems < ActiveRecord::Migration[6.2]
  def change
    remove_foreign_key :sale_line_items, :sales
    rename_column :sale_line_items, :store_transaction_id, :sale_id
    add_foreign_key :sale_line_items, :sales
  end
end
