class CreateMountedGemstones < ActiveRecord::Migration[6.1]
  def change
    create_join_table :gemstone_profiles, :pieces, table_name: :mounted_gemstones do |t|
      t.index :gemstone_profile_id
      t.index :piece_id
    end
  end
end
