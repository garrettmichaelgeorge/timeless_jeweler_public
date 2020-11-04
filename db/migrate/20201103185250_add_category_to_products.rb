class AddCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :category, :string, limit: 20
  end
end
