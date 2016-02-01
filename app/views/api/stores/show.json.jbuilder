json.id @store.id
json.name @store.name
json.phone @store.phone
json.address @store.address
json.start_time @store.start_time.strftime('%H:%M')
json.end_time @store.end_time.strftime('%H:%M')
json.holiday @store.holiday
json.review_cnt @store.reviews.size
if @store.grade_total?
  avg = (@store.grade_total / @store.reviews.size).round(1)
else
  avg = 0
end
json.grade_avg avg
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
