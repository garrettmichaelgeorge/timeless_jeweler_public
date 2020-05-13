class CreateHouseholds < ActiveRecord::Migration[6.0]
  def change
    create_table :households do |t|
      t.string :household_name, limit: 40
      t.date :anniversary

      t.timestamps
    end
  end
end
