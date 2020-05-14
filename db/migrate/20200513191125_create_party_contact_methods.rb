class CreatePartyContactMethods < ActiveRecord::Migration[6.0]
  def change
    create_table :party_contact_methods do |t|
      t.belongs_to :party, null: false, foreign_key: true

      t.timestamps
    end
    add_reference :addresses, :party_contact_method, foreign_key: true
    add_reference :email_addresses, :party_contact_method, foreign_key: true
    add_reference :phone_numbers, :party_contact_method, foreign_key: true
  end
end
