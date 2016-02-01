json.page @reviews.current_page
json.total @reviews.total_pages
json.records @reviews.size
json.rows @reviews do |review|
  json.id review.id
  json.store_id review.store_id
  json.user do
    json.user_id = review.user.id
    json.nickname review.user.nickname
    if review.user.image.present?
      json.url review.user.image.image.url
    end
  end
  json.detail review.detail 
  json.grade review.grade
  json.created_at review.created_at
  json.updated_at review.updated_at
  json.main_image review.images do |image|
    json.url image.url
  end
end
