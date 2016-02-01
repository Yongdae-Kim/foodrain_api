class User < ApplicationRecord
  has_one :image, as: :imageable
  has_many :user_auths
  has_many :reviews
end
