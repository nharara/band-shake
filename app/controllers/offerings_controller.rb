class OfferingsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @offerings = Offering.all
    @offerings = @offerings.search(params[:query]) if params[:query].present?
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

  def create
    @offerings = Offering.all
    @offering = Offering.new(offering_params)
    @offering.user = current_user
    if @offering.save
      redirect_to offering_path(@offering)
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  def offering_params
    params.require(:offering).permit(:price, :availability, :instrument, :photo, :url)
  end
end
