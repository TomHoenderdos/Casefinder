json.array!(@devicecases) do |devicecase|
  json.extract! devicecase, 
  json.url devicecase_url(devicecase, format: :json)
end
