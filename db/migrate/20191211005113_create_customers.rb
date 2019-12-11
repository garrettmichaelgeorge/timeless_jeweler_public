class CreateCustomers < ActiveRecord::Migration[6.0]
  def change
    create_table :customers do |t|
      t.string :first_name, limit: 25
      t.string :last_name, limit: 25
      # t.references :household, null: false, foreign_key: true
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
