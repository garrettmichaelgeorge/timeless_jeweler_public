class CreateStoreTransactionLineItems < ActiveRecord::Migration[6.0]
  def change
    create_table :store_transaction_line_items do |t|
      t.references :store_transaction, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
