class RemoveTimestampsFromHouseholdsPeople < ActiveRecord::Migration[6.0]
  def change
    remove_column :households, :created_at
    remove_column :households, :updated_at
    remove_column :people, :created_at
    remove_column :people, :updated_at
  end
end
