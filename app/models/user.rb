class User < ApplicationRecord
  include UsersHelper

  after_create :gen_user_auth

  has_one :image, as: :imageable
  has_many :user_auths
  has_many :reviews

  private

  def gen_user_auth
    UsersHelper.gen_user_auth(self)
  end
end
