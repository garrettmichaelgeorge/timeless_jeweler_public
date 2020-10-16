class RemoveColumnsFromProducts < ActiveRecord::Migration[6.0]
  def change
    change_table :products do |t|
      t.remove :size, :size_unit, :weight, :weight_unit, :long_name, :report_number, :clarity, :color, :purity, :misc_measurements
      t.remove :diamond_clarity_id, :diamond_color_id, :diamond_cut_id
      t.rename :short_name, :name
    end
  end
end
