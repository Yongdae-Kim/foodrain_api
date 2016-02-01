module Api
  class UsersController < ApplicationController
    include ImageHelper

    skip_before_filter :verify_authenticity_token, only: [:create, :signup]

    def index
      @user = UserAuth.find_by_access_token(params[:access_token]).user
    end

    def create
      @user = UserAuth.find_by_access_token(params[:access_token]).user
      add_user_param(@user)
      ImageHelper.update_single_image(params[:image], @user)
      @user.save!
    end

    def authentication
      @access_token = params[:access_token]
    end

    def signup
      @user = User.new
      add_user_param(@user)
      ImageHelper.create_single_image(params[:image], @user)
      @user.save!
    end

    def signin
    end

    private

    def add_user_param(user)
      user.email = params[:email]
      user.password = params[:password]
      user.phone = params[:phone]
      user.nickname = params[:nickname]
      user.gender = params[:gender]
    end
  end
end
