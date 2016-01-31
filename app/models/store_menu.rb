class StoreMenu < ApplicationRecord
  belongs_to :store

  has_many :images, as: :imageable
end
