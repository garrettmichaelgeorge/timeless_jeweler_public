class RemoveCreatorColumnFromProducts < ActiveRecord::Migration[6.0]
  def change
    remove_column :products, :creator, :string, limit: 40
  end
end
