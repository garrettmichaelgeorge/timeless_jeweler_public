class AddAddressableColumnsToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :addressable, null: false, polymorphic: true
    add_reference :email_addresses, :emailable, null: false, polymorphic: true
    add_reference :phone_numbers, :phoneable, null: false, polymorphic: true
    drop_join_table :parties, :addresses
    drop_join_table :parties, :email_addresses
    drop_join_table :parties, :phone_numbers
  end
end
