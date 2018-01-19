class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @product = Product.find params[:product_id]
    @review.product = @product
    @user = current_user
    @review.user_id = @user_id


    if @review.save
      redirect_to @product, notice: "Your review has been submitted ~~~ Thanks!"
    else
      flash[:notice] = 'Project saved successfully'
      redirect_to @product, notice: "Your review was not submitted. You need both a description and a rating ..."
    end

  end

private

  def review_params
    params.require(:review). permit(:description, :rating, :product_id, :user_id)
  end
end