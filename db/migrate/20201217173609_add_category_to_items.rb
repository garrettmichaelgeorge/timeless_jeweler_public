class AddCategoryToItems < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :category, :string, limit: 20
  end
end
