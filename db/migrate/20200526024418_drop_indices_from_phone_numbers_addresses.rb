class DropIndicesFromPhoneNumbersAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :party_contact_method_id
    remove_column :email_addresses, :party_contact_method_id
    remove_column :phone_numbers, :party_contact_method_id
  end
end
