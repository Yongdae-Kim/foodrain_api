class Store < ApplicationRecord
  has_many :images, as: :imageable
  belongs_to :store_owner

  scope :find_by_category, lambda { |category|
    where(category_id: category) if category.present?
  }

  def category_name
    CommonCode.find_by_code('CATEGORY', category_id)
  end
end
