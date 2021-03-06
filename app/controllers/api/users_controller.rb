module Api
  class UsersController < ApplicationController
    include ImageHelper
    include UsersHelper
    include ErrorHelper

    before_action :set_user_auth, only:
      [:index, :modify, :authentication,
       :reviews, :review_update, :review_destroy]

    before_action :set_review, only:
      [:review_update, :review_destroy]

    skip_before_filter :verify_authenticity_token, only:
      [:create, :authentication, :signup, :signin,
       :reviews, :review_update, :review_destroy]

    def index
      # 사용자 인증이 안되면 에러 제이선 출력
      if @user_auth.present?
        @user = @user_auth.user
        # else
        # ErrorHelper.error_handling(
        #    '사용자 인증 실패', '존재하지 않는 사용자입니다.'
        # )
        # render "error.json.jbuilder"
      end
    end

    def modify
      # 사용자 인증이 안되면 에러 제이선 출력
      if @user_auth.user.present?
        @user = @user_auth.user
        add_user_param(@user)
        ImageHelper.update_single_image(params[:image], @user)
        @user.save!
      end
    end

    def authentication
      # 사용자 인증이 안되면 에러 제이선 출력
      if @user_auth.user.present?
        @token = UsersHelper.gen_user_auth(@user_auth.user).access_token
      end
    end

    def signup
      # 사용자 로그인 모든 파라미터 nil 여부 체크 필요
      if User.available_email(params[:email])
        @user = User.new
        add_user_param(@user)
        ImageHelper.create_single_image(params[:image], @user)
        @user.save!
        @token = UsersHelper.gen_user_auth(@user).access_token
      end
    end

    def signin
      # 로그인 실패할 경우 제이선 에러 출력
      @user = User.existed_user(params[:email], params[:password])
      if @user.present?
        UsersHelper.gen_user_auth(@user)
        @user.save!
      end
    end

    def reviews
      # 사용자 인증이 안되면 에러 제이선 출력
      if @user_auth.user.present?
        @user = @user_auth.user
        @reviews = @user.reviews.includes(:store, :images).all.page(params[:page]).order(updated_at: :DESC)
      end
    end

    def review_update
      if (@user_auth.user && @review). present?
        @review.detail = params[:detail]
        @review.grade = params[:grade]
        @review.save!
      end
    end

    def review_destroy
      if (@user_auth.user && @review). present?
        @review.destroy
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

    def set_user_auth
      @user_auth = UserAuth.find_by_access_token(params[:access_token])
    end

    def set_review
      @review = Review.find(params[:review_id])
    end
  end
end
