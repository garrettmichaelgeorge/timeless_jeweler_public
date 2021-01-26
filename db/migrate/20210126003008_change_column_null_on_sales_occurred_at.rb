class ChangeColumnNullOnSalesOccurredAt < ActiveRecord::Migration[6.2]
  def change
    change_column_null :sales, :occurred_at, false
    add_index :sales, :occurred_at, unique: true,
                                    if_not_exists: true
  end
end
