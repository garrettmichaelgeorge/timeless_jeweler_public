class CreateMiscellaneousProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :miscellaneous_products do |t|
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end