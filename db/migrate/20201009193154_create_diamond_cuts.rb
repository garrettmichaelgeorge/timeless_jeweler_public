class CreateDiamondCuts < ActiveRecord::Migration[6.0]
  def change
    create_table :diamond_cuts do |t|
      t.string :grade, limit: 9

      t.timestamps
    end
  end
end
