class ProfilesController < ApplicationController
  def show
    @bookings = current_user.bookings
    @spots = current_user.spots
  end
end
