json.extract! product, :id, :customer_id, :metal, :purity, :size, :length, :weight, :miscellaneous_measurements, :color, :clarity, :report_number, :narrative_description, :cost, :notes, :retail_price, :source, :date_sold, :created_at, :updated_at
json.url product_url(product, format: :json)
