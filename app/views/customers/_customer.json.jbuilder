json.extract! customer, :id, :first_name, :household_id, :gender, :ring_size, :ring_size_notes, :necklace_length, :necklace_length_notes, :birthday, :created_at, :updated_at
json.url customer_url(customer, format: :json)
