class StoresController < ApplicationController
  include ImageHelper

  before_action :set_store, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @stores = Store.all
    respond_with(@stores)
  end

  def show
    respond_with(@store)
  end

  def new
    @store = Store.new
    respond_with(@store)
  end

  def edit
  end

  def create
    @store = Store.new(store_params)
    ImageHelper.create_multiple_images(params[:images], @store)
    @store.save
    respond_with(@store)
  end

  def update
    @store.update(store_params)
    ImageHelper.update_multiple_images(params[:images], @store)
    respond_with(@store)
  end

  def destroy
    @store.destroy
    respond_with(@store)
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(
      :category_id, :name, :address,
      :longitude, :latitude, :phone, :detail, :start_time,
      :end_time, :holiday, :store_owner_id, :images
    )
  end
end
