class AddNotesToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :notes, :text
  end
end
