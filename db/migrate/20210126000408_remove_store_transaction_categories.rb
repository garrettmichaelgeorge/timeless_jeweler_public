class RemoveStoreTransactionCategories < ActiveRecord::Migration[6.1]
  def change
    remove_reference :store_transactions, :store_transaction_category
    drop_table :store_transaction_categories, if_exists: true
  end
end
