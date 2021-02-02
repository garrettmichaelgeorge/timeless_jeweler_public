class DropMountedGemstones < ActiveRecord::Migration[6.2]
  def change
    drop_table :mounted_gemstones if table_exists?(:mounted_gemstones)
  end
end
