class RemoveProductCategories < ActiveRecord::Migration[6.0]
  def change
    remove_reference :products, :product_category, foreign_key: true, null: false
    drop_table :product_categories do |t|
      t.string :name, length: 40
    end
  end
end
