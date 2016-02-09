json.page @stores.current_page
json.total @stores.total_pages
json.records @stores.size
json.rows @stores do |store|
  json.id store.id
  json.name store.name
  json.address store.address
  json.review_count store.reviews.size
  json.grade_average store.grade_average
  json.images store.images do |si|
    json.url si.image.url(:medium)
  end
end
