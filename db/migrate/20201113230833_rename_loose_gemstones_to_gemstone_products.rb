class RenameLooseGemstonesToGemstoneProducts < ActiveRecord::Migration[6.0]
  def change
    rename_table :loose_gemstones, :gemstone_products
  end
end
