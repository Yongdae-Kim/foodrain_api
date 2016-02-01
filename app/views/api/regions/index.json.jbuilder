json.array! @regions do |region|
  json.id region.id
  json.address region.do + ' ' + region.gu + ' ' + region.dong
  json.location do
    json.latitude region.latitude
    json.longitude region.longitude
  end
end
