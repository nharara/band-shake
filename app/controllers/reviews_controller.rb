class ReviewsController < ApplicationController
  skip_before_action :authenticate_user!

  def create
    @review = Review.new(review_params)
    @booking = '???'
    @review.booking = @booking

    if @review.save
      redirect_to offerings_path(@booking.offering)
    else
      render '/bookings', status: :unprocessable_entity
    end
  end

  private

  def review_params
    require(:review).permit(:content, :rating)
  end
end
