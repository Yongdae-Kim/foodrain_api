json.page @stores.current_page
json.total @stores.total_pages
json.records @stores.size
json.rows @stores do |store|
  json.id store.id
  json.name store.name
  json.address store.address
  cnt = store.reviews.size
  json.review_cnt cnt
  json.grade_avg store.grade_total ? (store.grade_total / cnt).round(1) : 0
  json.images store.images do |si|
    json.uri si.image.url
  end
end
