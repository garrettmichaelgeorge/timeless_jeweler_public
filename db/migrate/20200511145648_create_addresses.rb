class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :address_line_1, limit: 80
      t.string :address_line_2, limit: 80
      t.string :city, limit: 30
      t.string :state_province, limit: 2
      t.string :country_region, limit: 2
      t.integer :zip_postal_code

      t.timestamps
    end
  end
end
