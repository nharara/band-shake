class BookingsController < ApplicationController
  def index
    @bookings = Booking.where(user: current_user)
  end

  def create
    @booking = Booking.new(booking_params)
    @offering = Offering.find(params[:offering_id])
    @booking.offering = @offering
    @booking.user = current_user

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

end
