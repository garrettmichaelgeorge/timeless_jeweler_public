class AddDateAcquiredColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :acquired_on, :date
    remove_column :products, :name, :string, limit: 40
    change_column :products, :short_name, :string, limit: 40
    change_column :products, :long_name, :string, limit: 255
  end
end
