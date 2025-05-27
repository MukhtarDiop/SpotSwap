class SpotsController < ApplicationController

  before_action :authenticate_user!,
  def index
    @spots = Spot.all

    if params[:address].present?
      @spots = @spots.where("location ILIKE ?", "%#{params[:address]}%")
    end

    if params[:type].present?
      @spots = @spots.where(spot_type: params[:type])
    end

    if params[:rental_duration].present?
      @spots = @spots.where(rental_duration: params[:rental_duration])
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
