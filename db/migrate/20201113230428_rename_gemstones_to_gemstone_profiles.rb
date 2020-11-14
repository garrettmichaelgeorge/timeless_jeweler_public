class RenameGemstonesToGemstoneProfiles < ActiveRecord::Migration[6.0]
  def change
    rename_table :gemstones, :gemstone_profiles
  end
end
