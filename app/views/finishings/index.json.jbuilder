json.array!(@finishings) do |finishing|
  json.extract! finishing, :name, :search_string
  json.url finishing_url(finishing, format: :json)
end
