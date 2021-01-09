class AddMerchantReferenceToUsers < ActiveRecord::Migration[6.2]
  def change
    add_reference :users, :merchant, null: false, foreign_key: true
  end
end
