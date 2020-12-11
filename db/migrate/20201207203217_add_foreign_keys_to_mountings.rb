class AddForeignKeysToMountings < ActiveRecord::Migration[6.1]
  def change
    remove_column :mountings, :jewelry_piece_id
    remove_column :mountings, :gemstone_id
    add_reference :mountings, :gemstone, null: false, foreign_key: true
    add_reference :mountings, :piece, null: false, foreign_key: true
  end
end
