json.array!(@patients) do |patient|
  json.extract! patient, :name, :birth
  json.url patient_url(patient, format: :json)
end
