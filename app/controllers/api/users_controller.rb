module Api
  class UsersController < ApplicationController
    include ImageHelper

    before_action :set_user
    skip_before_filter :verify_authenticity_token, only: [:create, :signup]

    def index
    end

    def create
      add_user_param(@user)
      @user.save!
    end

    def authentication
      @access_token = params[:access_token]
    end

    def signup
      @user = User.new
      add_user_param(@user)
      @user.save!
    end

    def signin
    end

    private

    def set_user
      @user = UserAuth.find_by_access_token(params[:access_token]).user
    end

    def add_user_param(user)
      user.email = params[:email]
      user.password = params[:password]
      user.phone = params[:phone]
      user.nickname = params[:nickname]
      user.gender = params[:gender]
    end
  end
end