class AddStoreTransactionCategoryRefToStoreTransactions < ActiveRecord::Migration[6.0]
  def change
    add_reference :store_transactions, :store_transaction_category, null: false, foreign_key: true
  end
end
