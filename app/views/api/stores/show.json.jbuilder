json.id @store.id
json.name @store.name
json.phone @store.phone
json.address @store.address
json.start_time @store.start_time.strftime('%H:%M')
json.end_time @store.end_time.strftime('%H:%M')
json.holiday @store.holiday
json.review_cnt @store.reviews.size
if @store.store_menus.present?
  json.menus @store.store_menus.images do |mi|
    json.uri mi.image.url
  end
else
  json.menus []
end
json.main_image @store.images do |si|
  json.uri si.image.url
end
