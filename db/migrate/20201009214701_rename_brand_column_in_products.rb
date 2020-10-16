class RenameBrandColumnInProducts < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :brand, :creator
  end
end
