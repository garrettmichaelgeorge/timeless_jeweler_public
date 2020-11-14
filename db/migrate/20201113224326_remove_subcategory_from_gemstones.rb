class RemoveSubcategoryFromGemstones < ActiveRecord::Migration[6.0]
  def change
    remove_reference :gemstones, :gemstone_subcategory, null: false
  end
end
