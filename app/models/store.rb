class Store < ApplicationRecord
  after_initialize :set_default_values
  # Paging
  paginates_per 20

  # Geocoder
  geocoded_by :address_for_geocode, latitude: :latitude, longitude: :longitude

  belongs_to :store_owner

  has_many :images, as: :imageable
  has_many :store_menus
  has_many :reviews

  scope :find_by_category, lambda { |category|
    where(category_id: category) if category.present?
  }

  scope :find_by_location, lambda { |lng, lat|
    near([lng, lat], 1) if (lng && lat).present?
  }

  def category_name
    CommonCode.find_by_code('CATEGORY', category_id)
  end

  def distance(lng, lat)
    (distance_to([lng, lat]) * 1000).round if (lng && lat).present?
  end

  private

  def set_default_values
    self.start_time ||= '06:00'
    self.end_time ||= '23:50'
    self.holiday ||= '휴무없음'
  end
end
