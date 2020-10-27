class CreateGemstones < ActiveRecord::Migration[6.0]
  def change
    create_table :gemstones do |t|
      t.references :gemstone_subcategory, null: false, foreign_key: true
      t.decimal :carat, precision: 5, scale: 2

      t.timestamps
    end
  end
end
