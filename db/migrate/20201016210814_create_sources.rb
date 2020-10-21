class CreateSources < ActiveRecord::Migration[6.0]
  def change
    create_table :sources do |t|
      t.string :code, limit: 1, null: false

      t.timestamps
    end
  end
end
