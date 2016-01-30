class CommonCodesController < ApplicationController
  before_action :set_common_code, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @common_codes = CommonCode.all
    respond_with(@common_codes)
  end

  def show
    respond_with(@common_code)
  end

  def new
    @common_code = CommonCode.new
    respond_with(@common_code)
  end

  def edit
  end

  def create
    @common_code = CommonCode.new(common_code_params)
    @common_code.save
    respond_with(@common_code)
  end

  def update
    @common_code.update(common_code_params)
    respond_with(@common_code)
  end

  def destroy
    @common_code.destroy
    respond_with(@common_code)
  end

  private

  def set_common_code
    @common_code = CommonCode.find(params[:id])
  end

  def common_code_params
    params.require(:common_code).permit(
      :main_code, :detail_code_id, :name_kor
    )
  end
end
