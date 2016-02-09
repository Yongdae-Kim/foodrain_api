class Store < ApplicationRecord
  after_initialize :set_default_values
  # Paging
  paginates_per 20

  # Geocoder
  geocoded_by :address, latitude: :latitude, longitude: :longitude
  after_validation :geocode

  belongs_to :store_owner

  has_many :images, as: :imageable
  has_many :reviews

  has_many :store_menus

  scope :find_by_category, lambda { |category|
    where(category_id: category) if category.present?
  }

  scope :find_by_location, lambda { |lat, lng|
    near([lat, lng], 1) if (lng && lat).present?
  }

  scope :oreder_by_review_count, lambda { |limit|
    order(reviews_count: :desc).limit(limit) if limit.present?
  }

 # scope :oreder_by_grade_average, lambda { |limit|
 #   order(grade_average: :desc).limit(limit) if limit.present?
 # }

  def category_name
    CommonCode.find_by_category(category_id)
  end

  def distance(lng, lat)
    (distance_to([lng, lat]) * 1000).round if (lng && lat).present?
  end

  def grade_average
    grade_total == 0 ? 0 : (grade_total / reviews_count).round(1)
  end

  private

  def set_default_values
    self.start_time ||= '06:00'
    self.end_time ||= '23:50'
    self.holiday ||= '휴무없음'
  end
end
