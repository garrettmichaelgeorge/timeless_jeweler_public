class AddItemReferenceToMiscellaneousItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :miscellaneous_items, :item, null: false, foreign_key: true
  end
end
