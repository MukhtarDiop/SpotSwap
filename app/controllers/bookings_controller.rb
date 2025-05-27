class BookingsController < ApplicationController
    def index
        @bookings = Booking.all
      end
      
    
    def approve
        @booking = Booking.find(params[:id])
        if @booking.spot.user == current_user
          @booking.update(status: "approved")
          redirect_to bookings_path, notice: "Booking approved."
        else
          redirect_to root_path, alert: "Not authorized."
        end
      end
      
      def decline
        @booking = Booking.find(params[:id])
        if @booking.spot.user == current_user
          @booking.update(status: "declined")
          redirect_to bookings_path, notice: "Booking declined."
        else
          redirect_to root_path, alert: "Not authorized."
        end
      end      
end
