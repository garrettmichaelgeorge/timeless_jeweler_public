class RenameProductStylesToItemStyles < ActiveRecord::Migration[6.1]
  def change
    remove_index :items, :product_style_id
    rename_table :product_styles, :item_styles
    rename_column :items, :product_style_id, :item_style_id
    add_index :items, :item_style_id
  end
end
