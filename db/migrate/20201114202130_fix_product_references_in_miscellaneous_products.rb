class FixProductReferencesInMiscellaneousProducts < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        return if foreign_key_exists?(:miscellaneous_products, :products)

        remove_column(:miscellaneous_products, :product_id) if column_exists?(:miscellaneous_products, :product_id)
        add_reference :miscellaneous_products, :product, null: false, foreign_key: true
      end

      dir.down do
        remove_reference :miscellaneous_products, :product, null: false, foreign_key: true
      end
    end
  end
end
