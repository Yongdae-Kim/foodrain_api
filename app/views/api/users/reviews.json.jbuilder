json.page @reviews.current_page
json.total @reviews.total_pages
json.records @reviews.size
json.rows @reviews do |review|
  json.id review.id
  json.store_id review.store_id
  json.detail review.detail
  json.grade review.grade
  json.created_at review.created_at
  json.updated_at review.updated_at
  json.images review.images do |ri|
    json.url ri.image.url
  end
end
