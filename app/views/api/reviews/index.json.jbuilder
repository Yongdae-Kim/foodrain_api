json.page @reviews.current_page
json.total @reviews.total_pages
json.records @reviews.size
json.rows @reviews do |review|
  json.id review.id
  json.store_id review.store_id
  json.user do
    json.user_id = review.user.id
    json.nickname review.user.nickname
    json.image do
      json.url review.user.image_url
    end
  end
  json.detail review.detail
  json.grade review.grade
  json.created_at review.created_at.to_s(:db)
  json.updated_at review.updated_at.to_s(:db)
  json.images review.images do |ri|
    json.url ri.image.url
  end
end
