class User < ApplicationRecord
  has_one :image, as: :imageable
  has_many :user_auths
  has_many :reviews

  scope :is_existed, lambda { |email|
    find_by(email: email).present?
  }
end
