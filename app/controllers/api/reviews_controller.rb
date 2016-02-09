module Api
  class ReviewsController < ApplicationController
    before_action :set_store, :set_user_auth

    skip_before_filter :verify_authenticity_token, only: :create

    def index
      @reviews = (@store&.reviews || Review)
                 .find_by_store(params[:store_id])
                 .find_by_user(params[:user_id])
                 .includes(:store, :user, :images)
                 .all
                 .page(params[:page])
                 .order(updated_at: :DESC)
    end

    def create
      if @user_auth.present?
        @review = Review.new
        @review.store_id = params[:store_id]
        @review.user_id = @user_auth.user.user_id
        @review.detail = params[:detail]
        @review.grade = params[:grade]
        @review.save!
      end
    end

    private

    def set_store
      @store = Store.find_by(store_id: params[:store_id])
    end

    def set_user_auth
      @user_auth = UserAuth.find_by_access_token(params[:access_token])
    end
  end
end
