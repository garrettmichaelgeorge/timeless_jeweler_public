class AddUserReferenceToSales < ActiveRecord::Migration[6.2]
  def change
    add_reference :sales, :user, null: false, foreign_key: true
  end
end
