class CreateItemOwnershipStatuses < ActiveRecord::Migration[6.2]
  def change
    create_table :item_ownership_statuses do |t|
      t.string :name, limit: 40, null: false
      t.string :code, limit: 1, null: false

      t.timestamps
    end
  end
end
