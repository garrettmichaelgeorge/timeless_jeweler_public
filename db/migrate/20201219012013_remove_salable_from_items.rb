class RemoveSalableFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :salable_id, :big_int
    remove_column :items, :salable_type, :string
  end
end
