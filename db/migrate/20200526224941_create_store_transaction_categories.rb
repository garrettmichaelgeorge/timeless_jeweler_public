class CreateStoreTransactionCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :store_transaction_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
