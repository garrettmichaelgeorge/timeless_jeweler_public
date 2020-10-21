class CreateDiamondGrades < ActiveRecord::Migration[6.0]
  def change
    create_table :diamond_grades do |t|
      t.references :diamond_cut, null: false, foreign_key: true
      t.references :diamond_color, null: false, foreign_key: true
      t.references :diamond_clarity, null: false, foreign_key: true

      t.timestamps
    end
  end
end
