class BookingController < ApplicationController
  before_action :authenticate_user!,:set_booking, only: %i[show edit update destroy]
  def index
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  def status
    @user = current_user
    @bookings = @user.bookings.find(params[:id])
  end
end
