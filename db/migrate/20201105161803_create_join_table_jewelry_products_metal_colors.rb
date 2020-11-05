class CreateJoinTableJewelryProductsMetalColors < ActiveRecord::Migration[6.0]
  def change
    create_join_table :jewelry_pieces, :metal_colors do |t|
      # TODO: add indices later!
    end
  end
end
