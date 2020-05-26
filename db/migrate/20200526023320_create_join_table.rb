class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :parties, :phone_numbers
    create_join_table :parties, :email_addresses
    create_join_table :parties, :addresses
  end
end
