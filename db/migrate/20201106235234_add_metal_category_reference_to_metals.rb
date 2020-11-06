class AddMetalCategoryReferenceToMetals < ActiveRecord::Migration[6.0]
  def change
    add_reference :metals, :metal_category, null: false, foreign_key: true
  end
end
