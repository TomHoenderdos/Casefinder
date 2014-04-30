json.array!(@cases) do |case_|
  json.extract! case_, :id, :name, :description, :color, :product_type, :material, :finishing, :size, :url

  if !case_.picture.url.nil?
    json.image_tag case_.picture.url
  else
    json.image_tag "/assets/noimg.png"
  end

  json.devices(case_.devices.to_a) do |d|
    json.id d.id
    json.full_name d.full_name 
    json.brand d.brand
  end

  json.sizes(case_.sizes.to_a) do |size|
    json.id size.id
    json.size size.size
    json.row_order size.row_order
  end

  json.url case_.url
end