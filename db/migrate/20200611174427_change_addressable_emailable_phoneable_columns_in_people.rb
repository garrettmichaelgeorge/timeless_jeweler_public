class ChangeAddressableEmailablePhoneableColumnsInPeople < ActiveRecord::Migration[6.0]
  def change
    remove_column :people, :email_address_id, :bigint
    remove_column :people, :email_address_type, :string
    remove_column :people, :addresses_id, :string
    remove_column :people, :addresses_type, :bigint
    remove_column :people, :phone_numbers_id, :string
    remove_column :people, :phone_numbers_type, :bigint
  end
end
