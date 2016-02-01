class StoreMenu < ApplicationRecord
  belongs_to :store

  has_one :image, as: :imageable
end
