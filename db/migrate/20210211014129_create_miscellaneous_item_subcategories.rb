class CreateMiscellaneousItemSubcategories < ActiveRecord::Migration[6.1]
  def change
    create_table :miscellaneous_item_subcategories do |t|
      t.string :name, limit: 40

      t.timestamps
    end
  end
end
