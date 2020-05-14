class AddBirthdayToPeople < ActiveRecord::Migration[6.0]
  def change
    add_column :people, :birthday, :date
  end
end
