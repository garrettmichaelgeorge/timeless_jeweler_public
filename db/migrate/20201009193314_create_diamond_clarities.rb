class CreateDiamondClarities < ActiveRecord::Migration[6.0]
  def change
    create_table :diamond_clarities do |t|
      t.string :grade, limit: 4

      t.timestamps
    end
  end
end
