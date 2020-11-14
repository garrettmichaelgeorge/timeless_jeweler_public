class AddProductReferencesToGemstoneProducts < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        return if foreign_key_exists?(:gemstone_products, :products)

        remove_column(:gemstone_products, :product_id) if column_exists?(:gemstone_products, :product_id)
        add_reference :gemstone_products, :product, null: false, foreign_key: true
      end

      dir.down do
        remove_reference :gemstone_products, :product, null: false, foreign_key: true
      end
    end
  end
end
