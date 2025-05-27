class SpotsController < ApplicationController
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
end
