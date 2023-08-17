class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def create
    @booking = Booking.new(booking_params)
    @offering = Offering.find(params[:offering_id])
    @booking.offering = @offering
    @booking.user = current_user
    @total = calculate_price

    if @booking.save
      redirect_to bookings_path
    else
      render 'offerings/show', status: :unprocessable_entity
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :status, :details)
  end

  def calculate_price
    end_date = DateTime.parse(booking_params[:end_date]).to_i
    start_date = DateTime.parse(booking_params[:start_date]).to_i
    ((end_date - start_date) / 3600) * @offering.price
  end

end
