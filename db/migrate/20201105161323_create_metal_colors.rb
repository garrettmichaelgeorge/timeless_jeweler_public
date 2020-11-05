class CreateMetalColors < ActiveRecord::Migration[6.0]
  def change
    create_table :metal_colors do |t|
      t.string :name, limit: 10

      t.timestamps
    end
    add_index :metal_colors, :name, unique: true
  end
end
