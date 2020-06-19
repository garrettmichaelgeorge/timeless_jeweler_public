class AddReportNumberColumnToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :report_number, :string
    add_column :products, :metal, :string
    add_column :products, :color, :string
    add_column :products, :clarity, :string
    add_column :products, :purity, :string
  end
end
