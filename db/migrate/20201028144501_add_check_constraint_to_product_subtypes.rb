class AddCheckConstraintToProductSubtypes < ActiveRecord::Migration[6.0]
  def up
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

  def down
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
end
