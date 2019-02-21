json.extract! profile, :id, :name, :surname, :education, :experience, :knowledge, :availability, :address, :user_id, :created_at, :updated_at
json.url profile_url(profile, format: :json)
