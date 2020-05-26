class DropPartyContactMethods < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :addresses, :party_contact_methods
    remove_foreign_key :email_addresses, :party_contact_methods
    remove_foreign_key :phone_numbers, :party_contact_methods
    remove_foreign_key :party_contact_methods, :parties
    remove_foreign_key :transaction_line_items, :products
    remove_foreign_key :transaction_line_items, :transactions
    remove_foreign_key :transactions, :parties

    drop_table :party_contact_methods do |t|
      t.bigint "party_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["party_id"], name: "index_party_contact_methods_on_party_id"
    end

    drop_table :transactions do |t|
      t.datetime "transaction_datetime"
      t.bigint "party_id", null: false
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["party_id"], name: "index_transactions_on_party_id"
    end

    drop_table :transaction_line_items do |t|
      t.bigint "transaction_id", null: false
      t.bigint "product_id", null: false
      t.integer "quantity"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
      t.index ["product_id"], name: "index_transaction_line_items_on_product_id"
      t.index ["transaction_id"], name: "index_transaction_line_items_on_transaction_id"
    end

  end
end
