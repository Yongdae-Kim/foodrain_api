class Review < ApplicationRecord
  after_create :add_store_grade_total
  before_update :update_store_grade_total
  before_destroy :subtract_store_grade_total

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

  private

  def add_store_grade_total
    store.grade_total += grade
    store.save!
  end

  def update_store_grade_total
    store.grade_total -= Review.find(review_id).grade
    store.grade_total += grade
    store.save!
  end

  def subtract_store_grade_total
    store.grade_total -= grade
    store.save!
  end
end
