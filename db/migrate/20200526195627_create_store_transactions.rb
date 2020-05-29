class CreateStoreTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :store_transactions do |t|
      t.references :party, null: false, foreign_key: true
      t.datetime :transaction_datetime

      t.timestamps
    end
  end
end
