json.array!(@devices) do |device|
  json.extract! device, :full_name, :brand
  json.url device_url(device, format: :json)
end
