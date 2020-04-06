class RemoveColumnFromCustomerTable < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :product_id
  end
end
