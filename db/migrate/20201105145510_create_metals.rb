class CreateMetals < ActiveRecord::Migration[6.0]
  def change
    create_table :metals do |t|
      t.string :name, limit: 40

      t.timestamps
    end
    add_index :metals, :name, unique: true
  end
end
