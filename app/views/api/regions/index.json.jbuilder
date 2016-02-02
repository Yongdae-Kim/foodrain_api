json.array! @regions do |region|
  json.address [region.do, region.gu, region.dong].compact.join(' ')
  json.location do
    json.latitude region.latitude
    json.longitude region.longitude
  end
end
