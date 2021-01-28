class CreateReports < ActiveRecord::Migration[6.2]
  def change
    create_table :gemstone_reports do |t|
      t.string :report_no, null: false
      t.text :text
      t.string :file_url
      t.references :gemstone, null: false, foreign_key: true

      t.timestamps
    end
    add_index :gemstone_reports, :report_no, unique: true
  end
end
