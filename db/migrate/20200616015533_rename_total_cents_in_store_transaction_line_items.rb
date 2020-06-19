class RenameTotalCentsInStoreTransactionLineItems < ActiveRecord::Migration[6.0]
  def change
    remove_column :store_transaction_line_items, :total_cents, :integer
    remove_column :store_transaction_line_items, :total_currency, :string
  end
end
