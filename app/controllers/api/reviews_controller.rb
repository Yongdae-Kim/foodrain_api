module Api
  class ReviewsController < ApplicationController
    before_action :set_store

    def index
      @reviews = (@store&.reviews || Review)
                 .find_by_store(params[:store_id])
                 .find_by_user(params[:user_id])
                 .includes(:store, :user, :images)
                 .all
                 .page(params[:page])
    end

    private

    def set_store
      @store = Store.find_by(store_id: params[:store_id])
    end
  end
end
