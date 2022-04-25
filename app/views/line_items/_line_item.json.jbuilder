json.extract! line_item, :id, :name, :booked_amount, :actual_amount, :adjustments, :created_at, :updated_at
json.url line_item_url(line_item, format: :json)
