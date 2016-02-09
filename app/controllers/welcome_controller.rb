class WelcomeController < ApplicationController
  def index
    # 카운트 컨테이너
    @user_size = User.all.size
    @store_size = Store.all.size
    @store_owner_size = StoreOwner.all.size
    @review_size = Review.all.size
    # 표 & 차트 컨테이너
    @common_code = CommonCode.all
    @stores_by_category = Store.all.group(:category_id).count
    @top_8_stores = Store.all.oreder_by_review_count(8)
  end
end
