class CreateJoinTableJewelryProductMetal < ActiveRecord::Migration[6.0]
  def change
    create_join_table :jewelry_pieces, :metals do |t|
      t.index %i[jewelry_piece_id metal_id]
      t.index %i[metal_id jewelry_piece_id]
    end
  end
end
