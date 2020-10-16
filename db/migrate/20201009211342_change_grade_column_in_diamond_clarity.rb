class ChangeGradeColumnInDiamondClarity < ActiveRecord::Migration[6.0]
  def change
    change_column_null :diamond_clarities, :grade, false
  end
end

