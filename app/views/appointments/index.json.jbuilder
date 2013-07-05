json.array!(@appointments) do |appointment|
  json.extract! appointment, :start, :end, :description, :patient_id, :title
  json.url appointment_url(appointment, format: :json)
end
