json.extract! event, :id, :title, :start_date, :end_date, :location, :agenda, :address, :organized_id, :created_at, :updated_at
json.url event_url(event, format: :json)
