class AddUserReferenceToItems < ActiveRecord::Migration[6.2]
  def change
    add_reference :items, :user, null: false, foreign_key: true
  end
end
