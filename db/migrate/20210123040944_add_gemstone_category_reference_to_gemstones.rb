class AddGemstoneCategoryReferenceToGemstones < ActiveRecord::Migration[6.1]
  def change
    add_reference :gemstone_profiles, :gemstone_category, null: false, foreign_key: true
  end
end
