class Store < ApplicationRecord
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
end
