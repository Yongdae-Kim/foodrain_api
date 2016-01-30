class StoreOwnersController < ApplicationController
  before_action :set_store_owner, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @store_owners = StoreOwner.all
    respond_with(@store_owners)
  end

  def show
    respond_with(@store_owner)
  end

  def new
    @store_owner = StoreOwner.new
    respond_with(@store_owner)
  end

  def edit
  end

  def create
    @store_owner = StoreOwner.new(store_owner_params)
    @store_owner.save
    respond_with(@store_owner)
  end

  def update
    @store_owner.update(store_owner_params)
    respond_with(@store_owner)
  end

  def destroy
    @store_owner.destroy
    respond_with(@store_owner)
  end

  private

  def set_store_owner
    @store_owner = StoreOwner.find(params[:id])
  end

  def store_owner_params
    params.require(:store_owner).permit(
      :email, :password, :name, :phone
    )
  end
end
