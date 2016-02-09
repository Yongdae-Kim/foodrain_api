json.id @store.id
json.name @store.name
json.phone @store.phone
json.address @store.address
json.detail @store.detail
json.start_time @store.start_time.strftime('%H:%M')
json.end_time @store.end_time.strftime('%H:%M')
json.holiday @store.holiday
json.review_count @store.reviews.size
json.grade_average @store.grade_average
if @store.store_menus
  json.menus @store.store_menus do |menu|
    json.url menu.image.image.url
  end
else
  json.menus []
end
json.images @store.images do |si|
  json.url si.image.url
end
