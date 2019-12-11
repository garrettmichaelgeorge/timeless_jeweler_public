class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.string :household_name, limit: 25
      t.string :street_name_and_no, limit: 50
      t.string :city, limit: 25
      t.string :state, limit: 2
      t.string :zip, limit: 5
      t.string :country, limit: 2
      t.string :marital_status, limit: 9
      t.date :anniversary
      t.string :referral_source, limit: 25

      t.timestamps
    end
  end
end
