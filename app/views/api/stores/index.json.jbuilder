json.page @stores.current_page
json.total @stores.total_pages
json.records @stores.size
json.rows @stores do |store|
  json.id store.id
  json.name store.name
  json.address store.address
  json.review_cnt store.reviews.size
  json.grade_avg 0
  json.images store.images do |si|
    json.uri si.image.url
  end
end
