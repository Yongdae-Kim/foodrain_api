json.id @store.id
json.category @store.category_name
json.name @store.name
json.phone @store.phone
json.address @store.address
json.start_time @store.start_time.strftime('%H:%M')
json.end_time @store.end_time.strftime('%H:%M')
json.holiday @store.holiday
cnt = @store.reviews.size
json.review_count cnt
json.grade_average @store.grade_total ? (@store.grade_total / cnt).round(1) : 0
if @store.store_menus
  json.menus @store.store_menus do |menu|
    json.uri menu.image.image.url
  end
else
  json.menus []
end
json.images @store.images do |si|
  json.uri si.image.url
end
