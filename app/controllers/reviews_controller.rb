class ReviewsController < ApplicationController
  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.new
  end

  def show
    @restaurant = Restaurant.find(params[:restaurant_id])
    @review = Review.find(params[:id])
  end

  def create
    @restaurant = Restaurant.find(params[:restaurant_id]) # find restaurant to assign review to
    @review = Review.new(review_params)                   # create new review
    @review.restaurant = @restaurant                      # link new review to restaurant

    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating)
  end
end

  # def create
  #   @review = Review.new(review_params)
  #   @restaurant = Restaurant.find(params[:restaurant_id])
  #   @review.restaurant = @restaurant
  #   @review.save
  #   redirect_to restaurant_path(@restaurant)
  # end
