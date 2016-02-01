json.page @stores.current_page
json.total @stores.total_pages
json.records @stores.size
json.rows @stores do |store|
  json.id store.id
  json.name store.name
  json.address store.address
  json.review_cnt store.reviews.size
  if store.grade_total?
    avg = (store.grade_total / store.reviews.size).round(1)
  else
    avg = 0
  end
  json.grade_avg avg
  json.images store.images do |si|
    json.uri si.image.url
  end
end
