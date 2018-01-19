class ReviewsController < ApplicationController


  before_action :require_login
  before_action :set_review, only: [:destroy]
  skip_before_action :require_login, only: [:destroy]

  def create
    @user = current_user
    @review = @user.reviews.new(review_params)
    @product = Product.find params[:product_id]
    @review.product = @product

    # @user = User.find(review_params[:user_id])


    if @review.save
      redirect_to @product, notice: "Your review has been submitted ~~~ Thanks!"
    else
      redirect_to @product, notice: "Your review was not submitted. You need both a description and a rating ..."
    end

  end

  def destroy
    @review.destroy
    redirect_to @review.product, notice: "Review successfully deleted"
  end

private

  def review_params
    params.require(:review).permit(:description, :rating, :product_id, :user_id)
  end

  def require_login
    unless current_user
      redirect_to @product, notice: "You must be logged in to write a review"
    end
  end

  def set_review
    @review = Review.find(params[:id])
  end
end