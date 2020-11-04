class RemoveProductCategories < ActiveRecord::Migration[6.0]
  def up
    remove_reference :products, :product_category
    drop_table :product_categories do |t|
      t.string :name, length: 40
    end

    connection.execute(
      'ALTER TABLE loose_gemstones
        DROP CONSTRAINT loose_gemstones_are_exclusive_ck;
      ALTER TABLE jewelry_pieces
        DROP CONSTRAINT jewelry_pieces_are_exclusive_ck;
      ALTER TABLE miscellaneous_products
        DROP CONSTRAINT miscellaneous_products_are_exclusive_ck;
      '
    )
  end

  def down
    create_table :product_categories do |t|
      t.string :name, length: 40
    end

    add_reference :products, :product_category
    connection.execute(
      'ALTER TABLE jewelry_pieces
        ADD CONSTRAINT jewelry_pieces_are_exclusive_ck
          CHECK (validate_exclusive_fn (product_id, 1) = true);
      ALTER TABLE loose_gemstones
        ADD CONSTRAINT loose_gemstones_are_exclusive_ck
          CHECK (validate_exclusive_fn (product_id, 2) = true);
      ALTER TABLE miscellaneous_products
        ADD CONSTRAINT miscellaneous_products_are_exclusive_ck
          CHECK (validate_exclusive_fn (product_id, 3) = true);
      '
    )
  end
end
