json.extract! person, :id, :description, :url_image, :role_id, :created_at, :updated_at
json.url person_url(person, format: :json)
