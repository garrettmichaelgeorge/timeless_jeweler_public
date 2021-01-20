class RemoveMerchantReferencesFromItemsAndUsers < ActiveRecord::Migration[6.2]
  def change
    remove_reference :items, :merchant, null: false, foreign_key: true
    remove_reference :users, :merchant, null: false, foreign_key: true
  end
end
