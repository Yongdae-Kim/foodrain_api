class Review < ApplicationRecord
  belongs_to :store
  belongs_to :user

  has_many :images, as: :imageable
end
