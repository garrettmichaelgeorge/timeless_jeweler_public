class AddGemstoneProfileReferenceToLooseGemstones < ActiveRecord::Migration[6.1]
  def change
    add_reference :loose_gemstones, :gemstone_profile, null: false, foreign_key: true
  end
end
