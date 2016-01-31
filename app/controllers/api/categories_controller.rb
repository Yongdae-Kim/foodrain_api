module Api
  class CategoriesController < ApplicationController
    def index
      @categories = CommonCode
                    .all
                    .find_by_main_code('CATEGORY')
    end
  end
end
