class ProfilesController < ApplicationController
  def show
    @bookings = current_user.bookings
    @spots = current_user.spots
    @my_spot_bookings = Booking.joins(:spot).where(spots: { user_id: current_user.id })
  end
end
