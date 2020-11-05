class CreateJoinTableMetalPuritiesJewelryPieces < ActiveRecord::Migration[6.0]
  def change
    create_join_table :metal_purities, :jewelry_pieces do |t|
      # TODO: add the following indices (with custom shortened names) later!
      # t.index [:metal_purity_id, :jewelry_piece_id]
      # t.index [:jewelry_piece_id, :metal_purity_id]
    end
  end
end
