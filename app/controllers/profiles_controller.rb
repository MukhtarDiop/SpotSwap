class ProfilesController < ApplicationController
  def show
    @bookings = current_user.bookings
    @spots = Spot.where.not(title: [nil, ""]).order(created_at: :desc).limit(6)
    @my_spot_bookings = Booking.joins(:spot).where(spots: { user_id: current_user.id })
  end
end
