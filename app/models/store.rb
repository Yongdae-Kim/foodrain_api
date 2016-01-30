class Store < ApplicationRecord
  has_many :images, as: :imageable
end
