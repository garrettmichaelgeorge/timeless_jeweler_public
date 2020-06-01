class AddShortNameLongNameToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :short_name, :string
    add_column :products, :long_name, :string
  end
end
