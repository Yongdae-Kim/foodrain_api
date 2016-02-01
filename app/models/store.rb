class Store < ApplicationRecord
  after_initialize :set_default_values

  paginates_per 20

  belongs_to :store_owner

  has_many :images, as: :imageable
  has_many :store_menus
  has_many :reviews

  scope :find_by_category, lambda { |category|
    where(category_id: category) if category.present?
  }

  def category_name
    CommonCode.find_by_code('CATEGORY', category_id)
  end

  private

  def set_default_values
    self.start_time ||= '06:00'
    self.end_time ||= '23:50'
    self.holiday ||= '휴무없음'
  end
end
