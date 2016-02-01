module Api
  class ReviewsController < ApplicationController
    def index
      @reviews = Review
                 .find_by_store(params[:store_id])
                 .find_by_user(params[:user_id])
                 .includes(:store, :user, :images)
                 .all
                 .page(params[:page])
    end
  end
end
