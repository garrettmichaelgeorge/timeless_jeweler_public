class AddCustomersReferenceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :customers, foreign_key: true
  end
end
