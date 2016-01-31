json.array! @categories do |category|
  json.id category.detail_id
  json.name category.name_kor
end
