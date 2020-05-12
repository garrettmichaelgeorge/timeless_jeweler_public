class CreateParties < ActiveRecord::Migration[6.0]
  # Create all tables related to customers
  def change
    # CREATE TABLE parties
    create_table :parties do |t|
      t.string :type

      t.timestamps
    end
  end
end
