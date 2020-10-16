class ChangeProductStyleIdInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :products, :product_style_id, false
    change_column_null :products, :product_category_id, false
    change_column_null :products, :name, false
  end
end
