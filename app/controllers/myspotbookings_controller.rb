class MyspotbookingsController < ApplicationController
  def index
    @bookings = Booking.joins(:spot).where(spots: { user_id: current_user })
  end
end
