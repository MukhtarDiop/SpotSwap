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
end
