class AddValidateExclusiveFunctionToProducts < ActiveRecord::Migration[6.0]
  def up
    connection.execute(
      "CREATE OR REPLACE FUNCTION validate_exclusive_fn (
        product_id            bigint,
        product_category_id   integer)
          RETURNS boolean
          LANGUAGE 'plpgsql'
      AS $BODY$
      DECLARE
        result_var            INTEGER;
      BEGIN
        SELECT COALESCE(1, 0)
            INTO result_var
            FROM products
           WHERE products.product_id            = $1
             AND products.product_category_id   = $2;

          RETURN result_var;
      END
      $BODY$;
      "
    )
  end

  def down
    connection.execute('DROP FUNCTION IF EXISTS validate_exclusive_fn')
  end
end
