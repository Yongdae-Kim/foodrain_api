json.array! @regions do |region|
  json.address [region.do, region.gu, region.dong].compact.join(' ')
  json.location do
    json.longitude region.longitude
    json.latitude region.latitude
  end
end
