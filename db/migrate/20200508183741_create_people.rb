class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people, id: false do |t|
      t.primary_key :party_id, unique: true
      t.string :title, limit: 20
      t.string :first_name, limit: 40
      t.string :last_name, limit: 40
      t.string :suffix, limit: 20
      t.decimal :ring_size, precision: 4, scale: 2
      t.text :ring_size_notes
      t.decimal :necklace_length, precision: 4, scale: 2
      t.text :necklace_length_notes

      t.timestamps
    end
    add_foreign_key :people, :parties
  end
end
