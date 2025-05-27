class BookingsController < ApplicationController
  def create
    @spot = Spot.find(params[:spot_id])
    @booking = Booking.new
  end

  def new
    @booking = Booking.new(booking_params)
    @booking.spot = @booking
    @booking.save

    redirect_to booking_path(@booking)
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
