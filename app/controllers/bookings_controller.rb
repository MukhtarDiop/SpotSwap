class BookingsController < ApplicationController
  before_action :authenticate_user!
  def index
    @bookings = Booking.all
  end

  def myspotbookings
     @bookings = Booking.joins(:spot).where(spots: { user_id: current_user })
  end


  def approve
    @booking = Booking.find(params[:id])
    @booking.update(status: "approved")
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.referer || root_path, notice: "Booking approved!" }
    end
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(status: "declined")
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to request.referer || root_path, notice: "Booking declined!" }
    end
  end

  def new
    @spot = Spot.find(params[:spot_id])
    @booking = Booking.new
    @booked_dates = @spot.bookings.pluck(:start_date, :end_date).flat_map do |start_date, end_date|
      (start_date.to_date..end_date.to_date).to_a
    end
  end

  def create
    @spot = Spot.find(params[:spot_id])
    @booking = Booking.new(booking_params)
    @booking.spot = @spot
    @booking.user = current_user
    @booking.status = "pending"
    if @booking.save
      redirect_to spot_path(@spot)
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
