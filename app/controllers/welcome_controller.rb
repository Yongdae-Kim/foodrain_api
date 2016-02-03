class WelcomeController < ApplicationController
  def index
    @user_size = User.all.size
    @store_size = Store.all.size
    @store_owner_size = StoreOwner.all.size
    @review_size = Review.all.size
  end
end
