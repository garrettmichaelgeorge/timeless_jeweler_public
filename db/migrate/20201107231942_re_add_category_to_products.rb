class ReAddCategoryToProducts < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :products, :category, :string, limit: 20

        Product.update_all category: 'MISCELLANEOUS'

        change_column_null :products, :category, false
      end

      dir.down do
        remove_column :products, :category
      end
    end
  end
end
