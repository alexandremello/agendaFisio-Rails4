json.array!(@exams) do |exam|
  json.extract! exam, :date, :description, :patient_id
  json.url exam_url(exam, format: :json)
end
