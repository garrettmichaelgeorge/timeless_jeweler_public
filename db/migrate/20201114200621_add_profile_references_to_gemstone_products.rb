class AddProfileReferencesToGemstoneProducts < ActiveRecord::Migration[6.0]
  def change
    reversible do |dir|
      dir.up do
        remove_column(:gemstone_products, :gemstone_id) if Product::GemstoneProduct.respond_to?(:gemstone_id)
        add_reference :gemstone_products, :gemstone_profile, null: false, foreign_key: true
      end

      dir.down do
        remove_reference :gemstone_products, :gemstone_profile, null: false, foreign_key: true
      end
    end
  end
end
