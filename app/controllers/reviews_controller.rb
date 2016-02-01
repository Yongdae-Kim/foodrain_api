class ReviewsController < ApplicationController
  include ImageHelper

  before_action :set_review, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @reviews = Review.all
    respond_with(@reviews)
  end

  def show
    respond_with(@review)
  end

  def new
    @review = Review.new
    respond_with(@review)
  end

  def edit
  end

  def create
    @review = Review.new(review_params)
    ImageHelper.create_multiple_images(params[:images], @review)
    @review.save
    respond_with(@review)
  end

  def update
    @review.update(review_params)
    ImageHelper.update_multiple_images(params[:images], @review)
    respond_with(@review)
  end

  def destroy
    @review.destroy
    respond_with(@review)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:store_id, :user_id, :detail, :grade)
  end
end
