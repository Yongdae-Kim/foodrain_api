class StoreMenusController < ApplicationController
  include ImageHelper

  before_action :set_store_menu, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @store_menus = StoreMenu.all
    respond_with(@store_menus)
  end

  def show
    respond_with(@store_menu)
  end

  def new
    @store_menu = StoreMenu.new
    respond_with(@store_menu)
  end

  def edit
  end

  def create
    @store_menu = StoreMenu.new(store_menu_params)
    ImageHelper.create_single_image(params[:image], @store_menu)
    @store_menu.save
    respond_with(@store_menu)
  end

  def update
    @store_menu.update(store_menu_params)
    ImageHelper.update_single_image(params[:image], @store_menu)
    respond_with(@store_menu)
  end

  def destroy
    @store_menu.destroy
    respond_with(@store_menu)
  end

  private

  def set_store_menu
    @store_menu = StoreMenu.find(params[:id])
  end

  def store_menu_params
    params.require(:store_menu).permit(:store_id, :image)
  end
end
