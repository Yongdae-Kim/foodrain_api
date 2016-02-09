class User < ApplicationRecord
  has_one :image, as: :imageable
  has_many :user_auths
  has_many :reviews

  def self.available_email(email)
    find_by(email: email).nil? if email.present?
  end

  def self.existed_user(email, password)
    find_by(email: email, password: password) if (email && password).present?
  end

  def image_url
    if image.present?
      image.image.url
    else
      'system/images/default_user.png'
    end
  end

  def gender_name
    CommonCode.find_by_gender(gender).name_kor
  end
end
