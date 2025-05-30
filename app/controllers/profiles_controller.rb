class ProfilesController < ApplicationController
  def show
    @bookings = current_user.bookings
    @spots = current_user.spots.order(created_at: :desc).limit(6)
    @my_spot_bookings = Booking.joins(:spot).where(spots: { user_id: current_user.id })
  end

  def update
    if current_user.update(user_params)
      redirect_to profile_path, notice: 'Profile updated!'
    else
      redirect_to profile_path, alert: 'Could not update profile.'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :profile_image)
  end
end
