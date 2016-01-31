module Api
  class RegionsController < ApplicationController
    def index
      @regions = Region
                 .all
                 .find_by_name(params[:name])
    end
  end
end
