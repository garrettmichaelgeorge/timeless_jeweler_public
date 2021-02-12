class CreatePieceSubcategories < ActiveRecord::Migration[6.2]
  def change
    create_table :piece_subcategories do |t|
      t.string :name, limit: 40
      t.string :code, limit: 1

      t.timestamps
    end
    add_index :piece_subcategories, :name, unique: true
    add_index :piece_subcategories, :code, unique: true
  end
end
