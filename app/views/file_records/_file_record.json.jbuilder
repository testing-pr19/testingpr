json.extract! file_record, :id, :created_at, :updated_at
json.url file_record_url(file_record, format: :json)
