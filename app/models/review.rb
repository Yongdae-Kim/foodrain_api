class Review < ApplicationRecord
  after_create :calc_store_grade_total

  paginates_per 20

  belongs_to :store, counter_cache: true
  belongs_to :user, counter_cache: true
  has_many :images, as: :imageable

  def self.find_by_store(store_id)
    where(store_id: store_id.to_i) if store_id.present?
  end

  def self.find_by_user(user_id)
    where(user_id: user_id.to_i) if user_id.present?
  end

  private

  def calc_store_grade_total
    store.grade_total += grade
    store.save!
  end
end
