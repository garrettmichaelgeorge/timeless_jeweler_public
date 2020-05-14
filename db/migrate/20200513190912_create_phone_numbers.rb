class CreatePhoneNumbers < ActiveRecord::Migration[6.0]
  def change
    create_table :phone_numbers do |t|
      t.string :phone_number_complete, limit: 32
      t.timestamps
    end
  end
end
