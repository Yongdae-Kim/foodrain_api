module Api
  class UsersController < ApplicationController
    def index
      @user = UserAuth.find_by_access_token(params[:access_token]).user
    end

    def update
    end

    def authentication
    end

    def signup
    end

    def signin
    end
  end
end
