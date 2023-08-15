class OfferingsController < ApplicationController
  def index
    @offerings = Offering.all
    @offering = Offering.new
  end

  def show
    @offering = Offering.find(params[:id])
  end

  def new
    @offering = Offering.new
  end

  def create
    @offering = Offering.find(params[:offering_id])
    @booking = Booking.new(offering_params)
    @booking.offering = @offering
    if @offering.save
      redirect_to restaurant_path(@offering)
    else
      render :new, status: :unprocessible_entity
    end
  end

  private

  def offering_params
    params.require(:offering).permit(:price, :initial_date, :final_date)
  end
end
