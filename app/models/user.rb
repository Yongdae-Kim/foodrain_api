class User < ApplicationRecord
  has_one :image, as: :imageable
  has_many :user_auths
  has_many :reviews

  def self.duplicated_email(email)
    find_by(email: email).present? if email.present?
  end

  def self.existed_user(email, password)
    find_by(email: email, password: password) if (email && password).present?
  end
end
