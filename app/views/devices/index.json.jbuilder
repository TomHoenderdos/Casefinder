json.array!(@devices) do |device|
  json.extract! device, :id, :full_name, :brand
  json.url device_url(device, format: :json)
end
