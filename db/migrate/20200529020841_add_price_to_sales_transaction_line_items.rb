class AddPriceToSalesTransactionLineItems < ActiveRecord::Migration[6.0]
  def change
    add_column :store_transaction_line_items, :price, :decimal, precision: 10, scale: 2 
  end
end
