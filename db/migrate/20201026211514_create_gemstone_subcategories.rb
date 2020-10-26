class CreateGemstoneSubcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :gemstone_subcategories do |t|
      t.string :name, limit: 40
      t.references :gemstone_category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
