class RemoveMetalAcquiredOnColumnsFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :acquired_on, :date
    remove_column :products, :metal, :string
  end
end
