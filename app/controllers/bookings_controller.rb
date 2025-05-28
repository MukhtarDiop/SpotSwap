class BookingsController < ApplicationController
  def index
    @bookings = Booking.all
  end

  def myspotbookings
     @bookings = Booking.joins(:spot).where(spots: { user_id: current_user })
  end


  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status: "approved")
    redirect_to bookings_path, notice: "Booking approved!"
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: "declined")
    redirect_to bookings_path, notice: "Booking declined!"
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @booking = Booking.new
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @booking = Booking.new(booking_params)
    @booking.spot = @spot
    @booking.user = current_user
    if @booking.save
      redirect_to spot_path(@spot), notice: "Booking requested!"
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def status
    @user = current_user
    @bookings = @user.bookings.find(params[:id])
  end
end
