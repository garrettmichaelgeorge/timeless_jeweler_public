class ChangeGradeColumnInDiamondColor < ActiveRecord::Migration[6.0]
  def change
    change_column_null :diamond_colors, :grade, false
  end
end
