json.extract! item, :id, :name, :description, :notes, :item_id, :container, :location_id, :created_at, :updated_at
json.url item_url(item, format: :json)
