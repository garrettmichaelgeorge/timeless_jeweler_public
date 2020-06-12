class CreateStateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :state_provinces do |t|
      t.string :code, limit: 2
      t.string :name, limit: 40

      t.timestamps
    end
  end
end
