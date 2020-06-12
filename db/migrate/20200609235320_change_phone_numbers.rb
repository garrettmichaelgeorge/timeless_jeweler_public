class ChangePhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    rename_column :phone_numbers, :phone_number_complete, :phone_number
  end
end
