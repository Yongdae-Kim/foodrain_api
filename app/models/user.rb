class User < ApplicationRecord
  has_many :image, as: :imageable
end
