class AddSalablePolymorphismToProducts < ActiveRecord::Migration[6.1]
  def change
    reversible do |dir|
      dir.up do
        Product.delete_all
        add_reference :products, :salable, polymorphic: true, null: false
      end

      dir.down do
        remove_reference :products, :salable, polymorphic: true, null: false
      end
    end
  end
end
