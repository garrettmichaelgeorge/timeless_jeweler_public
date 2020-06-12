class AddAddressableToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :addresses, polymorphic: true
    add_reference :households, :addresses, polymorphic: true
    add_reference :people, :email_address, polymorphic: true
    add_reference :households, :email_address, polymorphic: true
    add_reference :people, :phone_numbers, polymorphic: true
    add_reference :households, :phone_numbers, polymorphic: true
  end
end
