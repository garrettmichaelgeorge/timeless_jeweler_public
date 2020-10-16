class ChangeGradeColumnInDiamondCut < ActiveRecord::Migration[6.0]
  def change
    change_column_null :diamond_cuts, :grade, false
  end
end
