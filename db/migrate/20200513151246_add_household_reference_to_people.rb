class AddHouseholdReferenceToPeople < ActiveRecord::Migration[6.0]
  def change
    add_reference :people, :household, foreign_key: true
  end
end
