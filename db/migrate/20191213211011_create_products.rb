class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :metal
      t.string :purity
      t.decimal :size
      t.decimal :length
      t.decimal :weight
      t.text :miscellaneous_measurements
      t.string :color
      t.string :clarity
      t.integer :report_number
      t.text :narrative_description
      t.decimal :cost
      t.text :notes
      t.decimal :retail_price
      t.string :source
      t.date :date_sold

      t.timestamps
    end
  end
end
