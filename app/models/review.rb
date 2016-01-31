class Review < ApplicationRecord
  paginates_per 20

  belongs_to :store, counter_cache: true
  belongs_to :user, counter_cache: true
  has_many :images, as: :imageable

  scope :find_by_store, lambda { |store_id|
    where(store_id: store_id.to_i) if store_id.present?
  }

  scope :find_by_user, lambda { |user_id|
    where(user_id: user_id.to_i) if user_id.present?
  }
end
