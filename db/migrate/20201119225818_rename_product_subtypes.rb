class RenameProductSubtypes < ActiveRecord::Migration[6.1]
  def change
    rename_table :products, :items
    rename_table :jewelry_pieces, :pieces
    rename_table :miscellaneous_products, :miscellaneous_items
    rename_table :gemstone_profiles, :gemstones

    create_join_table :gemstones, :items do |t|
      t.index :gemstone_id
      t.index :item_id
    end

    drop_table :gemstone_products
  end
end
