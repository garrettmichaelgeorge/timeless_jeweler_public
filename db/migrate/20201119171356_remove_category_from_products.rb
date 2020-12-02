class RemoveCategoryFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_column :products, :category, :string, limit: 20
  end
end
