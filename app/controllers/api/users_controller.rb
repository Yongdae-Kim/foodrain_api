module Api
  class UsersController < ApplicationController
    include ImageHelper
    include UsersHelper

    skip_before_filter :verify_authenticity_token, only:
      [:create, :signup, :signin]

    def index
      # 사용자 인증이 안되면 에러 제이선 출력
      @user_auth = UserAuth.find_by_access_token(params[:access_token])
      @user = @user_auth.user if @user_auth.user.present?
    end

    def create
      # 사용자 인증이 안되면 에러 제이선 출력
      @user_auth = UserAuth.find_by_access_token(params[:access_token])
      if @user_auth.user
        @user = @user_auth.user
        add_user_param(@user)
        ImageHelper.update_single_image(params[:image], @user)
        @user.save!
      end
    end

    def authentication
      @access_token = params[:access_token]
    end

    def signup
      # 사용자 로그인 모든 파라미터 nil 여부 체크 필요
      if User.is_existed(params[:email])
        @user = User.new
        add_user_param(@user)
        ImageHelper.create_single_image(params[:image], @user)
        @user.save!
        @token = UsersHelper.gen_user_auth(@user).access_token
      end
    end

    def signin
      @user = User.find_by(email: params[:email], password: params[:password])
      if @user.present?
        UsersHelper.gen_user_auth(@user)
        @user.save!
      end
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
