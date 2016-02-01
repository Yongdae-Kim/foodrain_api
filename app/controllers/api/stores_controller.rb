module Api
  class StoresController < ApplicationController
    def index
      @stores = Store
                .find_by_category(params[:category])
                .includes(:images)
                .all
                .page(params[:page])
    end

    def show
      @store = Store.find(params[:id])
    end
  end
end
