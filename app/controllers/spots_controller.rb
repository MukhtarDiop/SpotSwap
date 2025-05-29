class SpotsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy]
  before_action :set_spot, only: [:show, :update, :destroy]
  before_action :authorize_spot_owner, only: [:update, :destroy]

  def index
    @spots = Spot.all
    if params[:location].present?
      @spots = @spots.where("description ILIKE ? OR category ILIKE ?", "%#{params[:location]}%", "%#{params[:location]}%")
      # If you have an address or city field, use that instead!
    end

    if params[:start_date].present? && params[:end_date].present?
      # Add your date filtering logic here, e.g., exclude spots that are booked in this range
      # This is a placeholder; actual logic depends on your booking model
    end
    @markers = @spots.geocoded.map do |spot|
        {
          lat: spot.latitude,
          lng: spot.longitude
        }
    end
  end

  def show
  end

  def new
    @spot = Spot.new
  end

  def create
    @spot = Spot.new(spot_params)
    @spot.user = current_user
    if @spot.save
      redirect_to spot_path(@spot)
    else
      logger.debug @spot.errors.full_messages
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @spot.update(spot_params)
      respond_to do |format|
        format.js   # renders update.js.erb
        format.html { redirect_to profile_path(anchor: "my-spots") }
      end
    else
      respond_to do |format|
        format.js   # renders update.js.erb with errors
        format.html { render :edit }
      end
    end
  end

  def destroy
    begin
      @spot.destroy
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.remove("spot_#{@spot.id}") }
        format.html { redirect_to profile_path(anchor: "my-spots"), notice: "Spot deleted." }
      end
    rescue ActiveRecord::InvalidForeignKey => e
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("spot_#{@spot.id}", partial: "spots/error", locals: { error: "Cannot delete spot with active bookings" }) }
        format.html { redirect_to profile_path(anchor: "my-spots"), alert: "Cannot delete spot with active bookings" }
      end
    end
  end

  private

  def set_spot
    @spot = Spot.find(params[:id])
  end

  def authorize_spot_owner
    unless @spot.user == current_user
      redirect_to root_path, alert: "You are not authorized to perform this action."
    end
  end

  def spot_params
    params.require(:spot).permit(:description, :lat, :long, :length, :width, :height, :category, :rate, :address, photos: [])
  end
end
