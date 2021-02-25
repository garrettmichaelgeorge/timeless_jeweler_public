class AddSubcategoryReferenceToMiscellaneousItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :miscellaneous_items, :miscellaneous_item_subcategory, null: false, foreign_key: true
  end
end
