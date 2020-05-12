class AddColumnsToPeople < ActiveRecord::Migration[6.0]
  def change
    remove_column :people, :party_id
    add_column :people, :id, :primary_key
  end
end