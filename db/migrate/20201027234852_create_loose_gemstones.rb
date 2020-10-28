class CreateLooseGemstones < ActiveRecord::Migration[6.0]
  def change
    create_join_table :gemstones, :products, table_name: :loose_gemstones do |t|
      t.index :gemstone_id
      t.index :product_id
    end
  end
end
