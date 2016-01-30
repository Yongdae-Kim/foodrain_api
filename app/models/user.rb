class User < ApplicationRecord
  has_one :image, as: :imageable
end
