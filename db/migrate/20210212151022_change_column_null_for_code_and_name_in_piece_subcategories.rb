class ChangeColumnNullForCodeAndNameInPieceSubcategories < ActiveRecord::Migration[6.1]
  def change
    change_column_null :piece_subcategories, :code, from: true, to: false
    change_column_null :piece_subcategories, :name, from: true, to: false
  end
end
