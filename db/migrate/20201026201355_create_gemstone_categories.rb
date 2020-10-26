class CreateGemstoneCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :gemstone_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
