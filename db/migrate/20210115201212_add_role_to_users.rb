class AddRoleToUsers < ActiveRecord::Migration[6.2]
  def change
    add_column :users, :role, :string, limit: 20, default: 'Clerk'
  end
end
