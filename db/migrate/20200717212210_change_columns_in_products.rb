class ChangeColumnsInProducts < ActiveRecord::Migration[6.0]
  def change
    change_column_null :products, :product_category_id, from: false, to: true
  end
end
