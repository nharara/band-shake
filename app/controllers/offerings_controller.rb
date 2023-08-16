class OfferingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @offerings = Offering.all
    @offering = Offering.new
  end

  def show
    @offerings = Offering.all
    @offering = Offering.find(params[:id])
    @booking = Booking.new
  end

  def new
    @offering = Offering.new
  end


  private

  def offering_params
    params.require(:offering).permit(:price, :availability, :instrument, :photo)
  end
end
