class AddTotalToStoreTransactionLineItems < ActiveRecord::Migration[6.0]
  def change
    add_monetize :store_transaction_line_items, :total
  end
end
