class CreateDiamondColors < ActiveRecord::Migration[6.0]
  def change
    create_table :diamond_colors do |t|
      t.string :grade, limit: 1

      t.timestamps
    end
  end
end
