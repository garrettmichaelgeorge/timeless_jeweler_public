class CreateJewelryPieces < ActiveRecord::Migration[6.0]
  def change
    create_table :jewelry_pieces do |t|

      t.timestamps
    end
  end
end
