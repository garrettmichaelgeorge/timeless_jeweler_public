class AddColumnsToCustomers < ActiveRecord::Migration[6.0]
  def change
    # Blow away the previous (simple) Customers table and replace with a new one replacing :last_name with a foreign key to Households
    drop_table :customers
    create_table :customers do |t|
      t.string :first_name, limit: 25
      t.references :household, null: false, foreign_key: true
      t.string :gender, limit: 1
      t.decimal :ring_size, precision: 2, scale: 2
      t.text :ring_size_notes, limit: 140
      t.integer :necklace_length, limit: 2
      t.text :necklace_length_notes, limit: 140
      t.date :birthday

      t.timestamps
    end
  end
end
