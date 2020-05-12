class AddActableColumnToParties < ActiveRecord::Migration[6.0]
  def change
    change_table :parties do |t|
      t.integer :actable_id
      t.string :actable_type
    end
  end
end