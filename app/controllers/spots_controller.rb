class SpotsController < ApplicationController

  before_action :authenticate_user!,

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
  end

  def show
    @spot = Spot.find(params[:id])
  end
  def new
  @spot = Spot.new
  end


  def create
    @spot = Spot.new(spot_params)
    @user = current_user
    @spot.user = current_user
    @spot.save
    redirect_to spot_path(@spot)
  end

  private
  
  def spot_params
    params.require(:spot).permit(:description, :lat, :long, :length, :width, :height, :category)
  end


end
