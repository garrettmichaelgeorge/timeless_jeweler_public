class AddItemOwnershipStatusReferenceToItems < ActiveRecord::Migration[6.1]
  def change
    add_reference :items, :item_ownership_status, null: false, foreign_key: true, index: true
  end
end
