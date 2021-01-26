class AddActualPriceToOrderLineItems < ActiveRecord::Migration[6.2]
  def change
    change_table :order_line_items do |t|
      # https://github.com/RubyMoney/money-rails#migration-helpers
      t.monetize :actual_price
    end
  end
end
