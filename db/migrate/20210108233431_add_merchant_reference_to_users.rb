class AddMerchantReferenceToUsers < ActiveRecord::Migration[6.1]
  def change
    add_reference :users, :merchant, null: false, foreign_key: true
  end
end
