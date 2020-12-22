class CreateGemstoneProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :gemstone_profiles do |t|
      t.decimal :carat
      t.string :role, limit: 20

      t.timestamps
    end
  end
end
