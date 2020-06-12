class ChangeStateProvinceColumnInAddresses < ActiveRecord::Migration[6.0]
  def change
    remove_column :addresses, :state_province
    add_reference :addresses, :state_province, null: false, foreign_key: true
    change_column :addresses, :zip_postal_code, :string
  end
end
