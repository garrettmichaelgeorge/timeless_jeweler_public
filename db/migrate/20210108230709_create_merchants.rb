class CreateMerchants < ActiveRecord::Migration[6.2]
  def change
    create_table :merchants do |t|
      t.string :name, null: false

      t.timestamps
    end

    add_index :merchants, :name, unique: true
  end
end
