class AddMerchantReferenceToItems < ActiveRecord::Migration[6.2]
  def change
    add_reference :items, :merchant, null: false, foreign_key: true
  end
end
