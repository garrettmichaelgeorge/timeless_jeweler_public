class CreateMountings < ActiveRecord::Migration[6.0]
  def change
    create_join_table :jewelry_pieces, :gemstones, table_name: :mountings do |t|
      t.index :jewelry_piece_id
      t.index :gemstone_id
    end
  end
end
