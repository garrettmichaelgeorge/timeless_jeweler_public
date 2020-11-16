class FixPrimaryKeyInGemstoneProducts < ActiveRecord::Migration[6.0]
  def change
    change_table :gemstone_products do |t|
      t.primary_key :id
    end

    remove_column :gemstone_products, :gemstone_id if column_exists? :gemstone_products, :gemstone_id
  end
end
