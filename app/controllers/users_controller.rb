class UsersController < ApplicationController
  include ImageHelper
  include UsersHelper

  before_action :set_user, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @users = User.all
    respond_with(@users)
  end

  def show
    respond_with(@user)
  end

  def new
    @user = User.new
    respond_with(@user)
  end

  def edit
  end

  def create
    @user = User.new(user_params)
    ImageHelper.create_single_image(params[:image], @user)
    @user.save
    UsersHelper.gen_user_auth(@user).access_token
    respond_with(@user)
  end

  def update
    @user.update(user_params)
    ImageHelper.update_single_image(params[:image], @user)
    respond_with(@user)
  end

  def destroy
    @user.destroy
    respond_with(@user)
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :email, :password, :nickname, :phone, :gender, :image
    )
  end
end
